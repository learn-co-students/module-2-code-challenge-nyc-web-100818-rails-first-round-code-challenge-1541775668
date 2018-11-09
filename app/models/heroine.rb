class Heroine < ApplicationRecord
    belongs_to :power
    validates_presence_of :super_name
    validates :super_name, uniqueness: { message: "already taken. C'mon don't be a copycat GET CREATIVE!!!" }, if: 'super_name.present?'
    validates_presence_of :name

    def self.search(search)
        if search
            power = Power.find_by(name: search)
            if power
                where(power_id: power)
            else
                Heroine.all
            end
        else
            Heroine.all
        end
    end
end
