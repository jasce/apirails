require File.join File.dirname(__FILE__), 'send_code'

class RespondBooking < ActiveRecord::Base

  belongs_to :booking
  belongs_to :store
end
