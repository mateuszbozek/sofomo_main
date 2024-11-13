class Location < ApplicationRecord
  belongs_to :geolocation
  has_many :languages
end
