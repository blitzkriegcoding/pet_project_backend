class LocationResource < JSONAPI::Resource
	attributes :id_location, :name
	has_many :temperature
	belongs_to :country
end