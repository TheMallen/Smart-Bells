class CreateWorkoutSets < ActiveRecord::Migration
  def change
    create_table :workout_sets do |t|
      t.integer :amount_of_resistance
      t.integer :amount_of_reps

      t.timestamps null: false
    end
  end
end
