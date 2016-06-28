module Authenticable

  # Devise methods overwrites
  def current_user
    @current_user ||= User.find_by(authentication_token: request.headers['Authorization'])
  end

  def current_store
      @current_store ||= Store.find_by(authentication_token: request.headers['Authorization'])
  end

  def authenticate_with_token!
       render json: { errors: "Not authenticated" },
                status: :unauthorized unless current_user.present?
  end


  def authenticate_with_store_token!
   
    render json: { errors: "Not authenticated" },
                status: :unauthorized unless current_store.present?
  end

  
  def user_signed_in?
    current_user.present?
  end
  def store_signed_in?
    current_store.present?
  end
end