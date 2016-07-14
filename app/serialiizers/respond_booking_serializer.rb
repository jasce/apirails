class RespondBookingSerializer < ActiveModel::Serializer
	include ActionView::Helpers::DateHelper
  attributes :discount,:store_id,:created_at
   
  def created_at
    
    time_ago_in_words(object.created_at)
  end


  has_one :booking
  has_one :store
  
end