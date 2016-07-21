class DropBusinessIndividualsUsers < ActiveRecord::Migration
  def change
  	drop_table :business_individuals_users
  end
end
