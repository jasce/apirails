class BusinessIndividuals::RegistrationsController< Devise::RegistrationsController

protected

  def sign_up_params
  
    params.require(:business_individual).permit(:name,:mobile,:city,:Pan,:Bank_name ,:Account_no,:IFSC,:referal,:email,:password, :password_confirmation)
  end

  def account_update_params
    params.require(:business_individual).permit(:name,:mobile,:city,:Pan,:Bank_name ,:Account_no,:IFSC,:referal,:email,:password, :password_confirmation,:current_password)
  end

end