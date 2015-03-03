class FixResistanceColumn < ActiveRecord::Migration
  def change
    change_column :workout_set_groups, :resistance, :integer, :default => 45
  end
end
