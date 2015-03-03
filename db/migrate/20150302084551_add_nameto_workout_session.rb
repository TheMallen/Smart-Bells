class AddNametoWorkoutSession < ActiveRecord::Migration
  def change
     add_column :workout_sessions, :name, :string
  end
end
