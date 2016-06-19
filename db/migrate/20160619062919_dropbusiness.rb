class Dropbusiness < ActiveRecord::Migration
  def change
  	drop_table :business_companies
  	drop_table :business_individuals
  end
end
