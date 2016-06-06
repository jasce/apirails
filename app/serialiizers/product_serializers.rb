class BookingSerializer < ActiveModel::Serializer
  attributes :id, :status, :Service_type
  has_one :user
end