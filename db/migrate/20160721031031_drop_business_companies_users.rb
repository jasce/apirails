class DropBusinessCompaniesUsers < ActiveRecord::Migration
  def change
  	drop_table :business_companies_users
  end
end
