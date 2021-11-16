class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new
  end

  def mybookings
    @bookings = Booking.joins(:flat).where(flat: {user: current_user})
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.status = 'pending'
    @flat = Flat.find(params[:flat_id])
    @booking.flat_id = @flat.id
    @booking.user_id = current_user
    number_of_days = @booking.end - @booking.start
    @booking.total_price = @flat.price * number_of_days
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to bookings_path
  end

  def respond
    @booking = Booking.find(params[:id])
    raise
    @booking.update(status: params[:status])
  end
end

private

def booking_params
  params.require(:booking).permit(:content, :start, :end)
end
