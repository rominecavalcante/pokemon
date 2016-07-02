class CreateEnergyCards < ActiveRecord::Migration
  def change
    create_table :energy_cards do |t|
      t.integer :element_type, null: false

      t.timestamps null: false
    end
  end
end
