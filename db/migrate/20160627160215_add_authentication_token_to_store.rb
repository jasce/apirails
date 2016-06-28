class AddAuthenticationTokenToStore < ActiveRecord::Migration
  def change
  	 add_column :stores, :authentication_token, :string
    add_index :stores, :authentication_token, unique: true
  end
end
