class Booking < ActiveRecord::Base
  before_create :set_status!
  after_create :change_format!

  belongs_to :user
  belongs_to :store
  belongs_to :store_category
  belongs_to :store_sub_category
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
def change_format!
    self.created_at   = self.created_at.strftime("%Y-%m-%d")
end

end


