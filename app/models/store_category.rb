class StoreCategory < ActiveRecord::Base
	has_many :store_sub_categories
	has_one :booking
end
