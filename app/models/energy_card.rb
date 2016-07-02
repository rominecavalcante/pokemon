class EnergyCard < ActiveRecord::Base

  validates :element_type, presence: true

  enum element_type: {water: 0, fire: 1, grass: 2, normal: 3}
end
