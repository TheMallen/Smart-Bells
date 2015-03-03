class AddCompletedToWorkoutSet < ActiveRecord::Migration
  def change
    add_column :workout_sets, :is_complete, :boolean
  end
end
