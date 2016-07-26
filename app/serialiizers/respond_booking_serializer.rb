class RespondBookingSerializer < ActiveModel::Serializer
	include ActionView::Helpers::DateHelper
  attributes :discount,:store_id,:created_at,:store_category_id
   
  def created_at
    
    time_ago_in_words(object.created_at)
  end

  	has_one :store_category
  has_one :booking
  has_one :store
  
end