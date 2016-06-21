class Api::V1::StoreCategoriesController < Api::V1::BaseApiController
#before_filter :authenticate_user_from_token!
  before_action :authenticate_with_token!
   respond_to :json
 def index
	   render json: StoreCategory.all
end


#def create
   # user = User.new(user_params)
   # if user.save
   #   render json: user, status: 201, location: [:api,:v1, user]
   # else
   #   render json: { errors: user.errors }, status: 422
   # end
#end

#def update
  #  user = current_user
 # if user.update(user_params)
 #   render json: user, status: 200, location: [:api,:v1, user]
#  else
 #   render json: { errors: user.errors }, status: 422
 #end
#end

def show
	#respond_with User.find(params[:id])
	render json: StoreCategory.find(params[:id]).store_sub_categories

end

#def destroy
#current_user.destroy   
 # head 204
#end

 # private

  #  def user_params
   #   params.require(:user).permit(:name,:email, :mobile, :house_no, :locality, :pincode,:password,:password_confirmation)
   # end
end