class UpdateStore < ActiveRecord::Migration
  def change
  	Store.all.each { |store| store.update_attribute(:otp_secret_key, ROTP::Base32.random_base32) }
  end
end
