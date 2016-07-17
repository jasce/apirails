# file: app/controller/api/v1/sessions_controller.rb
class Api::V1::S::SessionsController < Devise::SessionsController
  include Authenticable
 #acts_as_token_authentication_handler_for store

    skip_before_filter :verify_signed_out_store
   # skip_authorization_check only: [:create, :failure, ,  :new]    
before_filter :authenticate_with_store_token!, except: [:new, :create]
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json

  def create
    #----------------------------------------- This Works --------------------------------------
  
   	#store = store.find_for_database_authentication(email: params[:email])
	  # if store && BCrypt::Engine.hash_secret(params[:password],store.encrypted_password) ==  store.encrypted_password
	   #	token =  store.ensure_authentication_token
	   #	render json: {auth_token: token}
	   #else
	   #	render nothing: true, status: :unauthorized
	   	
	   #end

     #---------------------------------------- A better Approach Lets see if works-------------------
    store_password = params[:session][:password]
    store_email = params[:session][:email]
    store = store_email.present? && Store.find_by(email: store_email)

    if store.valid_password? store_password
      sign_in store, store: false
      store.generate_authentication_token!
      store.save
      render json: store, status: 200
    else
      render json: { errors: "Invalid email or password" }, status: 422
    end
    #--------------------------------------- This Works as well with full store record --------------
  end
  


  def destroy
    #---------------------------------------- A better Approach Lets see if works-------------------
    #token = request.headers["token"]
    #current_store = store.find_by(authentication_token: token) unless token.empty?
    #current_store.authentication_token = nil
    #current_store.save!
    #render json: {}
    store = Store.find_by(authentication_token: request.headers['Authorization'])
    store.generate_authentication_token!
    store.save
    head 204

  end

  def failure
    render :status => 401,
           :json => { :success => false,
                      :info => "Login Failed",
                      :data => {} }
  end


end