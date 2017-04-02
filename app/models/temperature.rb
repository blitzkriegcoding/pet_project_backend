class Temperature < ApplicationRecord
  belongs_to :location

  validates :temperature, presence: true
  validates :generated_at, presence: true

  def self.get_temp(location_id)
    query_temp = "select temperature as temp_kelvin, (temperature - 273) as temp_celsius, \
    ((((temperature - 273) + 32) * 9) / 5)::decimal(11,2) as temp_farenheit,\
    max(to_timestamp(generated_at)) as api_dt  \
    from temperatures where location_id = #{location_id} group by temperature limit 1"
    
    self.find_by_sql query_temp
  end


  def self.data_caching_temperature(location, country_initials)
    data = RestClient::Request.execute(method: :get, url: 'http://api.openweathermap.org/data/2.5/weather', timeout: 10, headers: {params: {q:"#{location}, #{country_initials}" , appid: 'bdcfb8b99a0839613f4ce6d6df6a1c9b'}})   
    
  end
  






end
