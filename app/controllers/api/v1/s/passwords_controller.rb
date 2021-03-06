class Api::V1::S::PasswordsController < Devise::PasswordsController

	def reset_password
		@store = Store.find_by_email(params[:email])
		if @store.present?
			@store.send_reset_password_instructions
			render json: { :alert => 'Sent Mail' }
		else
			render json: {:alert => 'no such email'	}		
		end
	end

	 protected
  def after_sending_reset_password_instructions_path_for(resource_name)
    
     end

end