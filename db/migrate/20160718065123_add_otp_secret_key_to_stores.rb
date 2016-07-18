class AddOtpSecretKeyToStores < ActiveRecord::Migration
  def change
    add_column :stores, :otp_secret_key, :string
  end
end
