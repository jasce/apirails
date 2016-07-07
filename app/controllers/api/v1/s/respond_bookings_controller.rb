class Api::V1::S::RespondBookingsController < Api::V1::BaseApiController
	respond_to :json

	 before_filter :authenticate_with_store_token!#, only: [:create,:update,:destroy]


	 def index
	 	render json: current_store.respond_bookings
	 end

	 def create
		 respond_booking = current_store.respond_bookings.build(respond_booking_params)
		
		   if respond_booking.save	
		   		book_id = respond_booking.booking_id	   		
		   		booking = Booking.find(book_id)
		   		booking.update(status: "Responded")
		      render json: respond_booking, status: 201#, location: [:api,:v1,:user, booking]
		   else
		      render json: { errors: respond_booking.errors }, status: 422
		   end
	 end



	 private

    def respond_booking_params
      params.require(:respond_booking).permit(:booking_id,:discount)
    end
end