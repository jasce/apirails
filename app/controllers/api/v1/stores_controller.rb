class Api::V1::StoresController < Api::V1::BaseApiController
  before_action :authenticate_with_token!
  respond_to :json

  def index
    respond_with current_user.stores
  end

  def show
  render json: current_user.stores.find(params[:id])
	end
    
    def storeswithlocation
    render json: Store.all.find_by(params[:city])
    end

end