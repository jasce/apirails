class CreateBusinessCompanies < ActiveRecord::Migration
  def change
    create_table :business_companies do |t|
      t.string :company_name
      t.string :website_url
      t.string :company_email
      t.string :contact_person
      t.string :mobile
      t.string :city
      t.string :services
      t.string :Pan
      t.string :Bank_name
      t.string :Account_no
      t.string :IFSC
      t.string :TIN
      t.string :TAN
      t.string :referal

      t.timestamps null: false
    end
  end
end
