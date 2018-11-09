class Heroine < ApplicationRecord
  belongs_to :power

  validates :super_name, uniqueness: true

  def self.filter_by_power(power)
    self.joins(:power).where("powers.name like ?", "%#{power}%")
  end
end
