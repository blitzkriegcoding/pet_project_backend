class Temperature < ApplicationRecord
  belongs_to :location

  validates :temperature, presence: true
  validates :location_id, presence: true
  validates :generated_at, presence: true

  def self.data_caching_temperature(location, country_initials)
    data = RestClient::Request.execute(method: :get, url: 'http://api.openweathermap.org/data/2.5/weather', timeout: 10, headers: {params: {q:"#{location}, #{country_initials}" , appid: 'bdcfb8b99a0839613f4ce6d6df6a1c9b'}})
  end

  def self.store_temp_data(data)    
    self.create(temperature: data[0], location_id: data[1], generated_at: data[2])
  end
 
end
