class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :store_name,:address
  has_many :bookings
end