class LocationController < ApplicationController
  
  def index
    @locations = Location.all
  end
  
  def new
    @location = Location.new
  end

  def create
  end

  private

  def location_params
    params.require(:location).permit(:name)
  end


end
