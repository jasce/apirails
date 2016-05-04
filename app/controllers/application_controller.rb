class ApplicationController < ActionController::Base
	include ApplicationHelper
 # include SessionsHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end



  def current_ability
    if current_user.kind_of?(User)
      @current_ability ||= UserAbility.new(current_user)
    elsif current_store.kind_of?(Store)
       @current_ability ||= StoreAbility.new(current_store)
    else
      @current_ability ||= GuestAbility.new()
      ##@current_ability ||= UserAbility.new(current_account)
    end
  end

 
end
