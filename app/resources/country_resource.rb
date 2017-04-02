class CountryResource < JSONAPI::Resource
	attributes :name_country, :initials
	has_many :locations
	
end
