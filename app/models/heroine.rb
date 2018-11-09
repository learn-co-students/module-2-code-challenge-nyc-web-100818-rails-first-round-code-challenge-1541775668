# More than one heroine can have the same power.
# More than one heroine can have the same power.
# More than one heroine can have the same power.
# Make sure no two heroines have the same super name.
  #Validations of single name applies here

class Heroine < ApplicationRecord
  belongs_to :power
  validates :super_name, :uniqueness => true
end
