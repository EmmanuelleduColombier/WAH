class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new
    authorize @booking
  end

  # def mybookings
  #   @bookings = Booking.joins(:flat).where(flat: {user: current_user})
  # end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.status = 'pending'
    @flat = Flat.find(params[:flat_id])
    @booking.flat_id = @flat.id
    @booking.user = current_user
    set_total_price if @booking.start && @booking.end
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(booking_params)
    redirect_to bookings_path
  end

  def respond
    @booking = Booking.find(params[:id])
    @booking.update(status: params[:status])
  end
end

private

def set_total_price
  number_of_days = @booking.end - @booking.start + 1
  @booking.total_price = @flat.price * number_of_days
end

def booking_params
  params.require(:booking).permit(:comments, :start, :end)
end
