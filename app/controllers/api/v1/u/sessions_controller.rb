# file: app/controller/api/v1/sessions_controller.rb
class Api::V1::U::SessionsController < Devise::SessionsController
  include Authenticable
 #acts_as_token_authentication_handler_for User

    skip_before_filter :verify_signed_out_user
   # skip_authorization_check only: [:create, :failure, ,  :new]    
 before_filter :authenticate_with_token!, except: [:create]
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json

  def create
    #----------------------------------------- This Works --------------------------------------
  
   	#user = User.find_for_database_authentication(email: params[:email])
	  # if user && BCrypt::Engine.hash_secret(params[:password],user.encrypted_password) ==  user.encrypted_password
	   #	token =  user.ensure_authentication_token
	   #	render json: {auth_token: token}
	   #else
	   #	render nothing: true, status: :unauthorized
	   	
	   #end

     #---------------------------------------- A better Approach Lets see if works-------------------
    user_password = params[:session][:password]
    user_email = params[:session][:email]
    user = user_email.present? && User.find_by(email: user_email)

    if user.valid_password? user_password
      sign_in user, store: false
      user.generate_authentication_token!
      user.save
      render json: user, status: 200
    else
      render json: { errors: "Invalid email or password" }, status: 422
    end
    #--------------------------------------- This Works as well with full user record --------------
  end



  def destroy
    #---------------------------------------- A better Approach Lets see if works-------------------
    #token = request.headers["token"]
    #current_user = User.find_by(authentication_token: token) unless token.empty?
    #current_user.authentication_token = nil
    #current_user.save!
    #render json: {}
    user = User.find_by(authentication_token: request.headers['Authorization'])
    user.generate_authentication_token!
    user.save
    head 204

  end

  def failure
    render :status => 401,
           :json => { :success => false,
                      :info => "Login Failed",
                      :data => {} }
  end


end