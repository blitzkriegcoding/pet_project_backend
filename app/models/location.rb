class Location < ApplicationRecord
  belongs_to :country
  has_many :temperature

  def self.get_country_location(location_id)
  	data_current_country = self.get_current_country(location_id)
    if $redis.hgetall("#{data_current_country[0][2]}").empty? then
	    data_owa = Temperature.data_caching_temperature(data_current_country[0][1], data_current_country[0][2])
	    data_json_owa = JSON.parse(data_owa)
	    $redis.hmset("#{data_current_country[0][2]}", "current_temp_kelvin", data_json_owa["main"]["temp"],\
	    											  "current_temp_celsius", (data_json_owa["main"]["temp"] - 273).round(2),\
	    											  "current_temp_farenheit", ((((data_json_owa["main"]["temp"] - 273) + 32) * 9) / 5).round(2),\
	    											  "location_id", data_current_country[0][3])	    
	end
	$redis.hgetall("#{data_current_country[0][2]}")
  end
  private
  def self.get_current_country(location_id)
  	current_country = self.select(:name_country, :initials, :name_location, :id).joins(:country).where(["locations.id = %d", "#{location_id}"]).limit(1).pluck(:name_country, :initials, :name_location, :id)
  	return current_country
  end
end
