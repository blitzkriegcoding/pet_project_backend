class Location < ApplicationRecord
	belongs_to :country
	has_many :temperature
end
