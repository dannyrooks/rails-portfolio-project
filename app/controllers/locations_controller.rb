class LocationsController < ApplicationController
  before_action :find_location, only: [:show, :new, :create, :index]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @locations = Location.all.order("name ASC")
  end
  
  def new
     @location = current_user.locations.build
  end

  def create
    @location = current_user.locations.build(location_params)
    if @location.save
    redirect_to locations_path
    else
      render 'new'
    end
  end

  def update
  end

  def show
    @location = Location.find_by(id: params[:id])
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
    @location = Location.find_by(id: params[:id])
  end

end
