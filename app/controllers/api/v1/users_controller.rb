class Api::V1::UsersController < ApplicationController
before_filter :authenticate_user_from_token!

def index
	if current_user
		render json: {hello: "hello"}
	
    else
    	render json: {}, status: :unauthorized
	end

end
end