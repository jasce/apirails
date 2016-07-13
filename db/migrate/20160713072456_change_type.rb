class ChangeType < ActiveRecord::Migration
  	def up
    change_column :bookings, :time, :string
  	end

  def down
    change_column :bookings, :time, :time
  end
  
end
