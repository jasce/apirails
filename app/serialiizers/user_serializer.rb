class UserSerializer < ActiveModel::Serializer
  attributes :id, :email,:locality,:pincode, :created_at, :updated_at, :authentication_token
end