class AddAddressToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :address, :string
  end
end
