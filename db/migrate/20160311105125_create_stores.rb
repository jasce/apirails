class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :store_name
      t.string :name
      t.string :mobile
      t.string :store_type
      t.string :city
      t.string :print_bill
      t.integer :delivery_persons
      t.integer :delivery_range

      t.timestamps null: false
    end
  end
end
