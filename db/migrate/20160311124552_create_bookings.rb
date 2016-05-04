class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :booking_id
      t.string :Service_type
      t.string :status
      t.references :user, index: true, foreign_key: true
      t.references :store, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
