class AddDefaultToWorkoutSet < ActiveRecord::Migration
  def change
     change_column_default :workout_sets, :is_complete, false
  end
end
