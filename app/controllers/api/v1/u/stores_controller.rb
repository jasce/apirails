class Api::V1::U::StoresController < Api::V1::BaseApiController
  before_action :authenticate_with_token!
  respond_to :json

  def index
    respond_with current_user.stores
  end

  def show
  render json: Store.find(params[:id])
	end
    
    def storeswithlocation
      
       render json: Store.near(params[:search],10)
       
  #render json: Store.where("address LIKE ?", "%#{params[:search]}%")   

  #  render json: Store.all
    end

end