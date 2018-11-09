class Heroine < ApplicationRecord
  belongs_to :power

  validates :super_name, uniqueness: true

  scope :by_power, -> (power) { joins(:power).where("powers.name like ?", "%#{power}%") }

end
