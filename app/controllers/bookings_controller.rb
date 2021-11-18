class BookingsController < ApplicationController

  def new
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.status = 'Pending'
    @flat = Flat.find(params[:flat_id])
    @booking.flat_id = @flat.id
    @booking.user = current_user
    set_total_price if @booking.start && @booking.end
    if @booking.save
      redirect_to dashboard_bookings_path
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
    @flat = Flat.find(@booking.flat_id)
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @flat = Flat.find(@booking.flat_id)
    @booking.update(booking_params)
    @booking.update(total_price: set_total_price)
    redirect_to dashboard_bookings_path
  end

  def dashboard
    @my_bookings = Booking.where(user: current_user)
    @my_flat_bookings = Booking.joins(:flat).where(flat: {user: current_user})
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(status: 'Accepted')
    redirect_to dashboard_bookings_path(tab: "Profile")
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.update(status: 'Declined')
    redirect_to dashboard_bookings_path(tab: "Profile")
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
