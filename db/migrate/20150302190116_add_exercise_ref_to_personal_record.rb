class AddExerciseRefToPersonalRecord < ActiveRecord::Migration
  def change
    add_reference :personal_records, :exercise, index: true
  end
end
