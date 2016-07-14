class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :store_name,:address, :authentication_token, :picture,:store_category_id
  has_one :store_category
  has_many :bookings
end