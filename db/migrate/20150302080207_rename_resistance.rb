class RenameResistance < ActiveRecord::Migration
  def change
    rename_column :workout_sets, :amount_of_resistance, :resistance
  end
end
