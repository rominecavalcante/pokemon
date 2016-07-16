class EnergyCard < ActiveRecord::Base

  validates :element_type, presence: true

  enum element_type: [:water, :fire, :grass, :normal, :power]
end
