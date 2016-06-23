class BookingSerializer < ActiveModel::Serializer
  attributes :id, :status, :store_category_id , :store_sub_category_id , :confirmed,:booking_date
  has_one :store_category
  has_one :user
end