class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :store_name
  has_many :bookings
end