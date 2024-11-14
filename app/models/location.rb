class Location < ApplicationRecord
  belongs_to :geolocation
  has_many :languages, dependent: :destroy

  validates :capital, uniqueness: true, presence: true
end
