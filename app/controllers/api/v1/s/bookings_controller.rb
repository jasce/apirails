class Api::V1::S::BookingsController < Api::V1::BaseApiController
  respond_to :json
    before_filter :authenticate_with_store_token!#, only: [:create,:update,:destroy]

   def index

   	# --------------------------------- Correspond to Hired Leads associated with current User ----------------------
   #respond_with Booking.where(["user_id = ? and store_id <> '' ", current_user.id  ])#Booking.search(params)

    # --------------------------------- Correspond to All Leads associated with current User ----------------------
    #render json:  Booking.where("user_id = ? ", current_user.id )
    render json: current_store.bookings.all

   # --------------------------------- Correspond to Open Leads associated with current User ----------------------
   #respond_with Booking.where(:store_id => nil)



  end


  def hired
  	  render json: Booking.where("(store_id = ? and status = ? )", current_store.id , "Hired" ).order("created_at desc")
  end

  

  
  def openall

   # @bookings = Booking.where('(status = ? )', "Responded")
   # @respond_bookings = RespondBooking.where('(status = ? and store_id = ? )', "Responded" , current_store.id)

   # get booking ids of all bookings that has the status not equal to hired
   b = Booking.select(:id).where('(status != ?)', "Hired")
   # get booking ids of all bookings that has the status not equal to hired
   r = RespondBooking.select(:id,:booking_id).where('(store_id = ?)', current_store.id)

   # get booking id from respond booking array
   booking_ids = r.map{|x| x.booking_id}

   #remove respond table id from main booking ids 

   open_booking_ids = b.reject{|x| booking_ids.include? x.id}
   
   @booking = Booking.find(open_booking_ids).reverse

  #	@booking =  Booking.where('(confirmed = ? and status = ?)' , true , "Unconfirmed").order("created_at desc")
   # @booking = RespondBooking.where.not('(store_id = ?)',current_store.id)
    #@booking = Booking.where('(status != ?)', "Hired").joins(:respond_bookings).where('( respond_bookings.store_id = ? OR respond_bookings.id = null)', current_store.id)
  #  @booking = Booking.all.joins(:respond_bookings).where('(bookings.status != ? and respond_bookings.store_id != ?)', "Hired", current_store.id).order("created_at desc")
        #Booking.where(:status => "Unconfirmed").joins("LEFT OUTER JOIN respond_bookings ON respond_bookings.booking_id = bookings.id")

    if stale?(@booking)
    	render json: @booking
	end

    #render json: Booking.where('(confirmed = ? and status = ?)' , true , "Unconfirmed").order("created_at desc")

  end 

  def show
    render json: Booking.find(params[:id])
  end


 
  end


