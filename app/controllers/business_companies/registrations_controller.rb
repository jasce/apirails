class BusinessCompanies::RegistrationsController< Devise::RegistrationsController

protected

  def sign_up_params
    params.require(:business_company).permit(:company_name,:website_url,:contact_person,:mobile,:city,:services,:Pan,:Bank_name ,:Account_no,:IFSC,:TIN,:TAN,:referal,:email,:password, :password_confirmation)
  end

  def account_update_params
    
    params.require(:business_company).permit(:company_name,:website_url,:contact_person,:mobile,:city,:services,:Pan,:Bank_name ,:Account_no,:IFSC,:TIN,:TAN,:referal,:email,:password, :password_confirmation,:current_password)
  end

end