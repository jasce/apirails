class CreateBusinessCompaniesUsers < ActiveRecord::Migration
  def change
    create_table :business_companies_users do |t|
      t.references :business_company, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
