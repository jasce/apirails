class Users::RegistrationsController< Devise::RegistrationsController
	
	protected

  def sign_up_params
    params.require(:user).permit(:name, :mobile, :email,:password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :mobile, :email, :password, :password_confirmation, :current_password)
  end
  def after_sign_up_path_for(resource)
      '/home'
  end

  def after_inactive_sign_up_path_for(resource_or_scope)
    session["user_return_to"] || root_path
  end

end