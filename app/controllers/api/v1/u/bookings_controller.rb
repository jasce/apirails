class Api::V1::U::BookingsController < Api::V1::BaseApiController
  respond_to :json
    before_action :authenticate_with_token!#, only: [:create,:update,:destroy]

   def index

   	# --------------------------------- Correspond to Hired Leads associated with current User ----------------------
   #respond_with Booking.where(["user_id = ? and store_id <> '' ", current_user.id  ])#Booking.search(params)

    # --------------------------------- Correspond to All Leads associated with current User ----------------------
    #render json:  Booking.where("user_id = ? ", current_user.id )
    render json: current_user.bookings.all

   # --------------------------------- Correspond to Open Leads associated with current User ----------------------
   #respond_with Booking.where(:store_id => nil)



  end

#=--------------------------------------------------Open Tab ---------------------------------------------------
  def open
  
  	render json: Booking.where('(user_id = ? and confirmed = ? and status = ?)', current_user.id, true , "Unconfirmed"  ).order("created_at desc")
  end
#-------------------------------------------------Responded Tab --------------------------------------------
  def responded
    render json: current_user.bookings.where('(status = ? )', "Responded").order("created_at desc")  
    
  end
 
 def responded_stores
    render json: RespondBooking.where(:booking_id => params[:id]).joins(:booking).where(:bookings => {:user_id => current_user.id,}).order("created_at desc")    
  end

  def responded_stores_count
    render json: { count: RespondBooking.where(:booking_id => params[:id]).joins(:booking).where(:bookings => {:user_id => current_user.id,}).count }
  end
#------------------------------------------------ Hire Tab ---------------------------------------------------- 

  def hired
      render json: Booking.where(["user_id = ? and status = ? ", current_user.id , "Hired" ]).order("created_at desc")
  end

  def hire_store
    @response = RespondBooking.find_by(:store_id => params[:store_id])
     booking = current_user.bookings.find(params[:id])
    if booking.update(:store_id => params[:store_id] , :discount => @response.discount , :status => "Hired")
    render json: booking , status: 200
    else
      render json: { errors: booking.errors }, status: 422
    end
  end

# ----------------------------------------------------End Custom Actions --------------------------------------
  def show
    render json: Booking.find(params[:id])
  end

   def create
    booking = current_user.bookings.build(booking_params)
    if booking.save
      params[:booking][:attachment_data].each do |file|
        booking.attachments.create!(attachment: file)
      end
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
      params.require(:booking).permit(:store_category_id,:store_sub_category_id,:date,:time,:address,:attachment_data => [])
    end
  end


