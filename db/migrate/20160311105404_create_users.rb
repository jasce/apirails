class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :mobile
      t.string :house_no
      t.string :locality
      t.string :pincode

      t.timestamps null: false
    end
  end
end
