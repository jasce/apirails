class CreateRespondBookings < ActiveRecord::Migration
  def change
    create_table :respond_bookings do |t|
      t.references :booking, index: true, foreign_key: true
      t.references :store, index: true, foreign_key: true
      t.integer :discount

      t.timestamps null: false
    end
  end
end
