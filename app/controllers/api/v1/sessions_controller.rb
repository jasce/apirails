# file: app/controller/api/v1/sessions_controller.rb
class Api::V1::SessionsController < Devise::SessionsController

 #acts_as_token_authentication_handler_for User

    #skip_before_filter :authenticate_user!, :only => [:create, :new]
   # skip_authorization_check only: [:create, :failure, ,  :new]    
 before_filter :authenticate_user_from_token!, except: [:create]
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json

  def create
    #warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    #render :status => 200,
     #      :json => { :success => true,
      #                :info => "Logged in",
       #               :data => { :auth_token => current_user.authentication_token } }
  
   	user = User.find_for_database_authentication(email: params[:email])
	   if user && BCrypt::Engine.hash_secret(params[:password],user.encrypted_password) ==  user.encrypted_password
	   	token =  user.ensure_authentication_token
	   	render json: {auth_token: token}
	   else
	   	render nothing: true, status: :unauthorized
	   	
	   end
  end

  def destroy
    token = request.headers["token"]
    current_user = User.find_by(authentication_token: token) unless token.empty?
    current_user.authentication_token = nil
    current_user.save!
    render json: {}
  end

  def failure
    render :status => 401,
           :json => { :success => false,
                      :info => "Login Failed",
                      :data => {} }
  end


end