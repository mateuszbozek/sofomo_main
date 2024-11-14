class Geolocation < ApplicationRecord
  before_destroy :destroy_languages

  has_one :location, dependent: :delete
  has_many :languages, through: :location

  validates :ip, uniqueness: true, presence: true, format: { with: /\A(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\z/,
                                                             message: ' has wrong format' }

  private

  def destroy_languages
    location.languages.destroy_all if location&.languages&.present? 
  end
end
