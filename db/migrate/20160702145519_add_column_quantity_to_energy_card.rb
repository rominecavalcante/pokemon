class AddColumnQuantityToEnergyCard < ActiveRecord::Migration
  def change
    add_column :energy_cards, :quantity, :integer, default: 1
  end
end
