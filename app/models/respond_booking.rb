class RespondBooking < ActiveRecord::Base
  belongs_to :booking
  belongs_to :store
end
