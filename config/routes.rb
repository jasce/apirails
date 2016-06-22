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
		    devise_scope :user do
		      post '/login' => 'sessions#create', :as => 'login'
		      delete '/logout' => 'sessions#destroy', :as => 'logout'
		    end
		    resources :users, :only => [:show, :create,:update,:destroy] do
		      resources :bookings, :only => [:update,:destroy,:create,:index] do
		        collection do
		          get :open
		          get :hired
		          get :openall
		          end
		      end

		      resources :stores, :only => [:index] do 
		      	collection do
		      		get :storeswithlocation
		      	end
		    	end
		    	
			end
			get '/categories/:id/name' => 'store_categories#name', :as => 'name'
			get '/categories' => 'store_categories#index', :as => 'categories'
		    get '/categories/:id' => 'store_categories#show', :as => 'subcategories'
  
		end
	end

  root to: "welcomes#index"
end
