class Remove < ActiveRecord::Migration
  def change
  	remove_column :bookings, :store_categories_id
  	  	remove_column :bookings, :store_sub_categories_id

  end
end
