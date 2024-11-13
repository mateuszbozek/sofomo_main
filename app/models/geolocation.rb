class Geolocation < ApplicationRecord
  has_one :location, dependent: :delete
  has_many :languages, through: :location, dependent: :destroy
end
