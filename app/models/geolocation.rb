class Geolocation < ApplicationRecord
  before_destroy :destroy_languages

  has_one :location, dependent: :delete
  has_many :languages, through: :location

  validates :ip, uniqueness: true, presence: true

  private

  def destroy_languages
    location.languages.destroy_all if location&.languages&.present? 
  end
end
