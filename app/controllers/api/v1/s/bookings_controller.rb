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
    render json: Booking.where('(confirmed = ? and status = ?)' , true , "Unconfirmed").order("created_at desc")
  end 

  def acceptbooking
        render json: Booking.find(params[:id]).update(:store_id => current_store.id)
      
  end



  def show
    render json: Booking.find(params[:id])
  end


 
  end


