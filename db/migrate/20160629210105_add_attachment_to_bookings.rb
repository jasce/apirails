class AddAttachmentToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :attachment, :string
  end
end
