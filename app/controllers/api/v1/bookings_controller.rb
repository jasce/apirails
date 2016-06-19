class Api::V1::BookingsController < Api::V1::BaseApiController
  respond_to :json
    before_action :authenticate_with_token!#, only: [:create,:update,:destroy]

   def index

   	# --------------------------------- Correspond to Hired Leads associated with current User ----------------------
   #respond_with Booking.where(["user_id = ? and store_id <> '' ", current_user.id  ])#Booking.search(params)

    # --------------------------------- Correspond to All Leads associated with current User ----------------------
    respond_with Booking.where("user_id = ? ", current_user.id )

   # --------------------------------- Correspond to Open Leads associated with current User ----------------------
   #respond_with Booking.where(:store_id => nil)



  end


  def hired
  	  respond_with Booking.where(["user_id = ? and store_id <> '' ", current_user.id  ])
  end


  def open
  	respond_with Booking.where(:store_id => nil)
  end



  def show
    respond_with Booking.find(params[:id])
  end

   def create
    booking = current_user.bookings.build(booking_params)
    if booking.save
      render json: booking, status: 201#, location: [:api,:v1,:user, booking]
    else
      render json: { errors: booking.errors }, status: 422
    end
  end

   def update
    booking = current_user.bookings.find(params[:id])
    if booking.update(booking_params)
      render json: booking, status: 200#, location: [:api,:v1,:user, booking]
    else
      render json: { errors: booking.errors }, status: 422
    end
  end

  def destroy
    booking = current_user.bookings.find(params[:id])
    booking.destroy
    head 204
  end


  private

    def booking_params
      params.require(:booking).permit(:status, :Service_type)
    end
  end


