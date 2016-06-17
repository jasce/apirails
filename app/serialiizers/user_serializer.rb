class UserSerializer < ActiveModel::Serializer
  attributes :id,:name,:email,:locality,:pincode, :created_at, :updated_at, :authentication_token
  has_many :bookings
end