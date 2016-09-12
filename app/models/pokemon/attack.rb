module Pokemon
  class Attack < ActiveRecord::Base

    validates :name, presence: true

  end
end
