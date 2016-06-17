class Api::V1::StoresController < ApplicationController
  before_action :authenticate_with_token!
  respond_to :json

  def index
    respond_with current_user.stores
  end

  def show
  respond_with current_user.stores.find(params[:id])
	end
    
    def storeswithlocation
    respond_with Store.find(params[:locality])
    end

end