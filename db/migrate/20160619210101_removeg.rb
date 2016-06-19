class Removeg < ActiveRecord::Migration
  def change
  	  	  	remove_column :bookings, :booking_id

  end
end
