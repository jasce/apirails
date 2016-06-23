class Timeforbooking < ActiveRecord::Migration
  def change
  	add_column :bookings, :booking_date , :string
  end
end
