class Language < ApplicationRecord
  belongs_to :location

  validates :code, presence: true
  validates :name, presence: true
  validates :native, presence: true

end
