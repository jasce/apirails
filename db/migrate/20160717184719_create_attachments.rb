class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :booking, index: true, foreign_key: true
      t.string :attachment

      t.timestamps null: false
    end
  end
end
