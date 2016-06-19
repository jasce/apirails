class Changestore < ActiveRecord::Migration
  def change
  	remove_column :stores, :store_type
  	remove_column :stores,:print_bill
  	remove_column :stores,:delivery_persons
  	remove_column :stores,:delivery_range
  	remove_column :stores,:city

  end
end
