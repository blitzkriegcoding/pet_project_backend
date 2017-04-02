class CountryResource < JSONAPI::Resource
	attributes :id_country, :name_country, :initials
	has_many :location
end
