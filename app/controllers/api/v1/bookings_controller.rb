class Api::V1::BookingsController < ApplicationController
  respond_to :json
    before_action :authenticate_with_token!, only: [:create,:update,:destroy]

   def index
     bookings = params[:booking_ids].present? ? Booking.find(params[:booking_ids]) : booking.all
    respond_with bookings 
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


