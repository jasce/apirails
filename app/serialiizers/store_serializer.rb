class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :store_name,:address, :authentication_token, :picture
  has_many :bookings
end