class LocationsController < ApplicationController
  before_action :find_location, only: [:show, :new, :create, :index]
  before_action :authenticate_user!
  
  def index
    @locations = Location.all.order("created_at ASC")
  end
  
  def new
     @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
    redirect_to locations_path
    else
      render 'new'
    end
  end

  def update

  end

  def show
    @location = Location.find(params[:id])
  end

  def destroy
    @location.destroy
    redirect_to root_path
  end

    private

  def location_params
    params.require(:location).permit(:name, :description)
  end

  def find_location
    @location = Location.find_by(params[:id])
  end

end
