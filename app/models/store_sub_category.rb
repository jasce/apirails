class StoreSubCategory < ActiveRecord::Base
  belongs_to :store_category
  has_one :bookings
end
