class ApplicationController < ActionController::Base
	

  include Authenticable
 # include SessionsHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
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

  private

def authenticate_user_from_token!
         token = request.headers["token"].presence
         user = token && User.find_by(authentication_token: (token.to_s))
        if user
          sign_in user, store: false
        end
end

 
end
