class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    @flat = Flat.find(@booking.flat_id)
    @flat.update(rating: ((@flat.rating + @review.rating) / 2))
    if @review.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
