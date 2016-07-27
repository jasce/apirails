class RespondBookingSerializer < ActiveModel::Serializer
	include ActionView::Helpers::DateHelper
  attributes :discount,:store_id,:created_at,:store_category_id,:user_name,:attach_list
   
  def created_at
    
    time_ago_in_words(object.created_at)
  end
  def user_name
  	object.booking.user.name
  end
def attach_list
	object.booking.attachments.each do |attachment|
		attachment.attachment_url
	end
end

  	has_one :store_category
  has_one :booking
  has_one :store
  
end