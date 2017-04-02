class CountryResource < JSONAPI::Resource
	attributes :id_country, :name, :initials
	has_many :location
end
