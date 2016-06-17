class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :store_name,:city
  has_many :bookings
end