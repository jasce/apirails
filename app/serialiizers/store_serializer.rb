class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :store_name,:address, :authentication_token
  has_many :bookings
end