require 'api_constraints'

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :stores, controllers: {registrations: "stores/registrations"}
  devise_for :users, controllers: {registrations: "users/registrations"}
  resources :users
 

  
  resources :stores

  resources :welcomes, only: [:index]
  
namespace :api do
  	namespace :v1 do
  		
  		# User app routes
  		namespace :u do
		    devise_scope :user do
		      post 'login' => 'sessions#create', :as => 'user_login'  # User App Login route
  		      delete 'logout' => 'sessions#destroy', :as => 'user_logout'# User App Logout route
		    end		   
		    resources :users, :only => [:create,:update,:destroy] # User Crud Routes

		      resources :bookings, :only => [:update,:destroy,:create,:index] do
		        collection do
		          get :open  # User Open Bookings
		          get :responded
		          get :hired  # User Hired Bookings		         
		         get '/:id/responded_all' => 'bookings#responded_all' 
		          end
		      end

		      resources :stores, :only => [:index] do 
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
		      post 'login' => 'sessions#create', :as => 'store_login'
		      delete 'logout' => 'sessions#destroy', :as => 'store_logout'
		    end
		    resources :stores , :only => [:create,:delete,:update]
		    resources :bookings, :only => [] do
		    	resources :respond_bookings, :only => [:create]
		        collection do
		          get :responded  # User Open Bookings
		          get :hired  # User Hired Bookings
		          get :openall # All Users Open Bookings
		          put 'acceptbooking/:id' => 'bookings#acceptbooking', :as => 'accept_booking'  # Grab the booking with the id and update store_id field		          
		          end
		      end
		      resources :respond_bookings, :only => [:index]


		end 





			

		end

	end
  root to: "welcomes#index"
end
