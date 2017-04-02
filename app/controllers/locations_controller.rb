class LocationsController < JSONAPI::ResourceController
  respond_to :json
  def get_current_temp    
    respond_with Location.get_country_location(params[:location_id])
  end	
end
