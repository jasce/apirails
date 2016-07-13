class RespondBookingSerializer < ActiveModel::Serializer
  attributes :discount,:store_id
  has_one :booking
  has_one :store
  
end