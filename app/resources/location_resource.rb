class LocationResource < JSONAPI::Resource
	attributes :name_location
	has_many :temperature
	belongs_to :country
end