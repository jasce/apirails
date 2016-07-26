class AddStoreCategoryToRespond < ActiveRecord::Migration
  def change
  	add_reference :respond_bookings , :store_category, index: true
  end
end
