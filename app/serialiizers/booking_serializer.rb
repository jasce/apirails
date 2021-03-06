class BookingSerializer < ActiveModel::Serializer
	include ActionView::Helpers::DateHelper
  attributes :id, :status,:address,:time, :confirmed,:date,:discount,:store_id,:created_at
  
  def created_at
    
    time_ago_in_words(object.created_at)
  end
  


  has_one :store_category
  has_one :user
 has_one :store
 has_many :attachments


end