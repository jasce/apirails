Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :business_individuals, controllers: {registrations: "business_individuals/registrations"}
  devise_for :business_companies, controllers: {registrations: "business_companies/registrations"}
  devise_for :stores, controllers: {registrations: "stores/registrations"}
  devise_for :users, controllers: {registrations: "users/registrations"}
  resources :users
 

  
  resources :stores

  resources :business_companies
  resources :business_individuals
  resources :welcomes, only: [:index]
  
namespace :api, defaults: {format: :json },constraints: {subdomain: 'api' }, path: '/' do
  	scope module: :v1, constraints: ApiConstraints.new(version: 1 , defaults: true) do
    devise_scope :user do
      post '/login' => 'sessions#create', :as => 'login'
      delete '/logout' => 'sessions#destroy', :as => 'logout'
    end
    resources :users, :only => [:show, :create,:update]
	end
  
end

  root to: "welcomes#index"
end
