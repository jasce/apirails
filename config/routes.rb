require 'api_constraints'

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :stores, controllers: {registrations: "stores/registrations",sessions: "stores/sessions",passwords: "stores/passwords",confirmations: "stores/confirmations"}
  devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions",passwords: "users/passwords",confirmations: "users/confirmations"}
  resources :users
 
get '/home' => 'pages#home'
  get '/how-it-works' => 'pages#howitworks'
  get '/store-listings' => 'pages#storelistings'
  get '/contact' => 'pages#contact'
  get '/faq' => 'pages#faq'
  get '/success' => 'pages#success_password_changed'
  
  resources :stores

  
namespace :api do
  	namespace :v1 do
  		
  		# User app routes
  		namespace :u do
		    devise_scope :user do
		    	post 'password/reset' => 'passwords#reset_password', :as => 'user_reset_password'
		      post 'login' => 'sessions#create', :as => 'user_login'  # User App Login route
  		      delete 'logout' => 'sessions#destroy', :as => 'user_logout'# User App Logout route
		    end		   
		    resources :users, :only => [:create,:update,:destroy] # User Crud Routes
		    
 			 post "users/verify" => 'users#verify'
 			 post "users/resend" => 'users#resend'
  			

		      resources :bookings, :only => [:update,:destroy,:create,:index] do
		        collection do
		          get :open  # User Open Bookings
		          get :responded
		          get :hired  # User Hired Bookings		         
		         get '/:id/responded_stores' => 'bookings#responded_stores' 
		         get '/:id/responded_stores_count' => 'bookings#responded_stores_count' 
		         put '/:id/stores/:store_id' => 'bookings#hire_store'
		          end
		      end

		      resources :stores, :only => [:index,:show] do 
		      	collection do
		      		get :storeswithlocation    # Find Location Of Nearby Stores By User
		      	end
		    end

		    get '/categories/:id/name' => 'store_categories#name', :as => 'name'  # Access Only Name of Category for Booking
			get '/categories' => 'store_categories#index', :as => 'categories'    # Get all Store Categories By User
		    get '/categories/:id' => 'store_categories#show', :as => 'subcategories'   #Get corressponding Sub-Category from Category Id

		# -----------------------------------------------User App ends Here----------------------------------------------    	
		end


		# --------------------------------------Store App Starts Here ------------------------------------------
		namespace :s do

			devise_scope :store do
				post 'password/reset' => 'passwords#reset_password', :as => 'store_reset_password'
		      post 'login' => 'sessions#create', :as => 'store_login'
		      delete 'logout' => 'sessions#destroy', :as => 'store_logout'

		      post "stores/verify" => 'stores#verify'
		      post "stores/resend" => 'stores#resend'
		    end
		    resources :stores , :only => [:create,:delete,:update,:show]
		    resources :bookings, :only => [] do
		    	resources :respond_bookings, :only => [:create]
		        collection do
		          get :responded  # User Open Bookings
		          get :hired  # User Hired Bookings
		          get :openall # All Users Open Bookings
		                   
		          end
		      end
		      resources :respond_bookings, :only => [:index]


		end 





			

		end

	end
 root to: "pages#home"
end
