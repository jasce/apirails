require File.join File.dirname(__FILE__), 'send_code'

class Booking < ActiveRecord::Base
 
 
  before_create :set_status!

  

  


  belongs_to :user
  belongs_to :store
  belongs_to :store_category
  belongs_to :store_sub_category
  has_many :respond_bookings
  has_many :attachments
  attr_accessor :attachment_data

  validates :user_id , presence: true

  scope :filter_by_status, lambda { |keyword|
    where("lower(status) LIKE ?", "%#{keyword.downcase}%" ) 
  }

  scope :filter_by_Service_type, lambda { |keyword|
    where("lower(Service_type) LIKE ?", "%#{keyword.downcase}%" ) 
  }
  scope :recent, -> {
    order(:updated_at)
  }



def self.search(params = {})
    bookings = params[:booking_ids].present? ? Booking.find(params[:booking_ids]) : Booking.all

    bookings = bookings.filter_by_status(params[:keyword]) if params[:keyword]
    bookings = bookings.filter_by_Service_type(params[:keyword]) if params[:keyword]
    bookings = bookings.recent(params[:recent]) if params[:recent].present?

    bookings
  end

 
  private
def set_status!

  self.confirmed = true
  self.status = 'Unconfirmed' 
end
end


