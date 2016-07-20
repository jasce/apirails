class Api::V1::U::PasswordsController < Devise::PasswordsController

	def reset_password
		@store = User.find_by_email(params[:email])
		if @store.present?
			@store.send_reset_password_instructions
			render json: { :alert => 'Sent Mail' }
		else
			render json: {:alert => 'no such email'	}		
		end
	end

	

end