class CreateBusinessIndividuals < ActiveRecord::Migration
  def change
    create_table :business_individuals do |t|
      t.string :name
      t.string :mobile
      t.string :city
      t.string :Pan
      t.string :Bank_name
      t.string :Account_no
      t.string :IFSC
      t.string :referal

      t.timestamps null: false
    end
  end
end
