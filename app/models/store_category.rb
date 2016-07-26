class StoreCategory < ActiveRecord::Base
	has_many :store_sub_categories
	has_one :booking
	has_one :store
	has_one :respond_bookings
end
