class Api::V1::UsersController < ApplicationController
before_filter :authenticate_user_from_token!

#def index
#	if current_user
#		render json: {hello: "hello"}
#	
 #   else
  #  	render json: {}, status: :unauthorized
	#end

#end


def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 201, location: [:api, user]
    else
      render json: { errors: user.errors }, status: 422
    end
  end
def update
  user = User.find(params[:id])

  if user.update(user_params)
    render json: user, status: 200, location: [:api, user]
  else
    render json: { errors: user.errors }, status: 422
  end
end

  private

    def user_params
      params.require(:user).permit(:name, :mobile, :house_no, :locality, :pincode,:password,:password_confirmation)
    end
end