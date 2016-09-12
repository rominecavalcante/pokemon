class CreateTableAttack < ActiveRecord::Migration
  def change
    create_table :attacks do |t|
      t.string :name
      t.integer :energy_quantity, default: 0
      t.integer :damage_quantity, default: 0
      t.integer :multiplied_attack, default: 1

      t.timestamps null: false
    end
  end
end
