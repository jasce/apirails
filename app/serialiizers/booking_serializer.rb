class BookingSerializer < ActiveModel::Serializer
	include ActionView::Helpers::DateHelper
  attributes :id, :status, :store_category_id , :store_sub_category_id ,:address,:time, :confirmed,:date,:attachment,:discount,:store_id,:created_at
  
  def created_at
    time_ago_in_words(object.created_at)
  end

  has_one :store_category
  has_one :user
 has_one :store


end