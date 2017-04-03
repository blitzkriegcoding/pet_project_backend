class LocationsController < JSONAPI::ResourceController
  respond_to :json
  def get_current_temp    
    respond_with Location.get_country_location(params[:location_id])
  end

  def get_all_locations
  	# respond_with (Location.get_all_locations) do |format|
  	data = Location.get_all_locations
    render json: data.to_json
  end	
end
