class Stores::RegistrationsController < Devise::RegistrationsController

	protected

	def sign_up_params
		params.require(:store).permit(:store_name,:name,:mobile, :address , :email, :password, :password_confirmation)
	end

	def account_update_params
		params.require(:store).permit(:store_name,:name,:mobile, :email,:address, :password, :password_confirmation, :current_password)
	end
	def after_sign_up_path_for(resource)
     '/home'
    end
end

