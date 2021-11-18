class FlatsController < ApplicationController
  def index
    if params[:query].present?
      @flats = Flat.search_by_address(params[:query])
    else
      @flats = Flat.all
    end
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
    authorize @flats
  end

  def show
    @flat = Flat.find(params[:id])
    authorize @flat
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    authorize @flat
    @flat.user = current_user
    if @flat.save
      redirect_to flats_path
    else
      render :new
    end
  end

  def edit
    @flat = Flat.find(params[:id])
    authorize @flat
  end

  def update
    @flat = Flat.find(params[:id])
    authorize @flat
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path
  end

  def myflats
    @flats = policy_scope(Flat)
    @bookings = []
    @flats.each do |flat|
      @bookings.push(Booking.where(flat: flat))
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:title, :address, :room_type, :persons, :price, :owner_present, :has_pet, :has_computer,
                                  :has_coffee, :description, photos: [])
  end
end
