class LocationsController < ApplicationController
  def index
  	@locations = Trip.find(params[:trip_id]).locations
  end

  def new
  	@trip = Trip.find(params[:trip_id])
  	@location = Location.new
  end

  def create
  	@trip = Trip.find(params[:trip_id])
  	@location = @trip.locations.new(location_params)
  	 if @location.save
       redirect_to trip_locations_path(@trip)
     else
       render :new
    end
  end

  def show
  	@location = Trip.find(params[:trip_id]) #.location
  end

  def edit
  end

  def destroy
  	if @location.destroy
  		redirect_to locations_path
  	else
  		# flash[:error] = @trip.errors.full_messages.join("\n")
  		redirect_to location_path(@location)
  	end
  end

  private

  def location_params
  	params.require(:location).permit(:name)
  end

  # def location
  # 	@location = Location.find(params[:id])
  # end
end
