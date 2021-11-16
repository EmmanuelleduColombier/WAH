class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to flats_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def myflats
    #@restaurants = policy_scope(Restaurant).order(created_at: :desc)
  end

  private

  def flat_params
    params.require(:flat).permit(:title, :address, :room_type, :persons, :price, :owner_present, :has_pet, :has_computer,
                                      :has_coffee, :description)
  end
end
