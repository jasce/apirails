class RespondBookingSerializer < ActiveModel::Serializer
  attributes :discount
  has_one :booking
  has_one :store
  
end