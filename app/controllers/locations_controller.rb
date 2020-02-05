class LocationsController < ApplicationController
  before_action :find_location, only: [:show, :new, :create, :index]
  
  def index
    @locations = Location.all
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

  def show
  end

  private
  
  def find_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :description)
  end

end
