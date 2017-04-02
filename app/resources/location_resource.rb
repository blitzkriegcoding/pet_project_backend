class LocationResource < JSONAPI::Resource
	attributes :id_location, :name_country
	has_many :temperature
	belongs_to :country
end