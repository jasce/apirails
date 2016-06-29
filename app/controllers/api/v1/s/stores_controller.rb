class Api::V1::S::StoresController < Api::V1::BaseApiController
 before_action :authenticate_with_store_token!, except: [:create]
  respond_to :json

  #def index
   # respond_with current_user.stores
  #end

  #def show
  #render json: current_user.stores.find(params[:id])
	#end


    
    def storeswithlocation
      
       render json: Store.near(params[:search],10)
       
  #render json: Store.where("address LIKE ?", "%#{params[:search]}%")   

  #  render json: Store.all
    end



def create
    store = Store.new(store_params)
    if store.save
      render json: store, status: 201
    else
      render json: { errors: store.errors }, status: 422
    end
end

def update
    store = Store.find(params[:id])
  if store.update(store_params)
    render json: store, status: 200
  else
    render json: { errors: store.errors }, status: 422
  end
end


def destroy
current_store.destroy   
  head 204
end


     private

    def store_params
      params.require(:store).permit(:name,:email, :mobile,:password,:password_confirmation,:picture,:store_name)
    end

end