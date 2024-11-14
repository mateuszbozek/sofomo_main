class Location < ApplicationRecord
  belongs_to :geolocation
  has_many :languages, dependent: :destroy

  validates :capital, presence: true
  validates :calling_code, presence: true
  validates :geoname_id, presence: true

end
