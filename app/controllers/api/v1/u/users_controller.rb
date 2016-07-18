class Api::V1::U::UsersController < Api::V1::BaseApiController
#before_filter :authenticate_user_from_token!
  before_action :authenticate_with_token!, only: [:update, :destroy]
 respond_to :json
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
     # SendCode.new.send_sms(:to => user.mobile, :body => "Your OTP of my awesome website is #{user.otp_code}" )

      render json: user, status: 201

    else
      render json: { errors: user.errors }, status: 422
    end
end
def verify
  user = User.find(params[:user][:id])
  otp = params[:user][:otp]
  @otp = otp.to_s
    if(user.authenticate_otp( @otp , drift: 120))
       render json: user, status: 201      
    else
        render json: { errors: "Wrong OTP ! Try Again"}
    end
end

def update
    user = current_user
  if user.update(user_params)
    render json: user, status: 200
  else
    render json: { errors: user.errors }, status: 422
  end
end

def show
	#respond_with User.find(params[:id])
	render json: User.find(params[:id])

end

def destroy
current_user.destroy   
  head 204
end

  private

    def user_params
      params.require(:user).permit(:name,:email, :mobile,:password,:password_confirmation,:picture)
    end
end