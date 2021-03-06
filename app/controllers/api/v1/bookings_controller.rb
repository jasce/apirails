class Api::V1::BookingsController < Api::V1::BaseApiController
  respond_to :json
    before_action :authenticate_with_token!#, only: [:create,:update,:destroy]

   def index

   	# --------------------------------- Correspond to Hired Leads associated with current User ----------------------
   #respond_with Booking.where(["user_id = ? and store_id <> '' ", current_user.id  ])#Booking.search(params)

    # --------------------------------- Correspond to All Leads associated with current User ----------------------
    #render json:  Booking.where("user_id = ? ", current_user.id )
    render json: Booking.all

   # --------------------------------- Correspond to Open Leads associated with current User ----------------------
   #respond_with Booking.where(:store_id => nil)



  end


  def hired
  	  render json: Booking.where(["user_id = ? and store_id <> '' ", current_user.id  ])
  end

  def open
  
  	render json: Booking.where('(user_id = ? and confirmed = ? )', current_user.id, true  )
  end
  def openall
    render json: Booking.where('(confirmed = ? )' , true)
  end 



  def show
    render json: Booking.find(params[:id])
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
      params.require(:booking).permit(:store_category_id,:store_sub_category_id,:date,:time,:confirmed)
    end
  end


