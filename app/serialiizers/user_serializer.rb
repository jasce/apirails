class UserSerializer < ActiveModel::Serializer

  attributes :id,:name,:email,:created_at, :updated_at, :authentication_token,:picture,:mobile


  has_many :bookings
end
