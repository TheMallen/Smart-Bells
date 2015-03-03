class CreateWorkoutSetGroup < ActiveRecord::Migration
  def change
     create_table :workout_set_groups do |t|
      t.integer :resistance
      t.integer :number_of_sets
      t.integer :reps_per_set
      t.timestamps null: false
    end
     add_reference :workout_set_groups, :exercise, index: true
     add_reference :workout_set_groups, :workout_session, index: true
  end
end