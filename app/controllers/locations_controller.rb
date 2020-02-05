class LocationController < ApplicationController
  
  def index
    @locations = Location.all
  end
  
  def new
    @location = Location.new
  end

  def create
  end


end
