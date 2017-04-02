class TemperatureResource < JSONAPI::Resource
	attributes :temperature
	belongs_to :location
end