class AddDiscountToBooking < ActiveRecord::Migration
  def change
  	add_column :bookings, :discount , :integer
  end
end
