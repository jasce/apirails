class RemoveRedundantFields < ActiveRecord::Migration
  def change
  	remove_column :bookings , :Service_type
  	remove_column :bookings , :booking_time
  	remove_column :bookings , :booking_date
  	remove_column :bookings , :attachment
  	remove_column :users , :authy_id
  	remove_column :users , :image

  end
end
