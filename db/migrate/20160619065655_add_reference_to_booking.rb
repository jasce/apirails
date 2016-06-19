class AddReferenceToBooking < ActiveRecord::Migration
  def change
  	add_reference :bookings, :store_category, index: true
  	add_reference :bookings, :store_sub_category, index: true
  	add_column :bookings, :date, :date
  	add_column :bookings, :time, :time
  end
end
