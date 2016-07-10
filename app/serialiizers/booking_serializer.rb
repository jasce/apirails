class BookingSerializer < ActiveModel::Serializer
  attributes :id, :status, :store_category_id , :store_sub_category_id ,:address,:time, :confirmed,:date,:attachment,:discount,:store_id
  has_one :store_category
  has_one :user
 has_one :store

end