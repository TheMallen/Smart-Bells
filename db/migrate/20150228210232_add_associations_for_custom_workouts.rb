# By: Mathew Allen
# Mostly generated by rake
# Defines the database migration
class AddAssociationsForCustomWorkouts < ActiveRecord::Migration
  def change
    add_reference :workout_sets, :exercise, index: true
    add_reference :workout_sets, :workout_session, index: true
    add_reference :personal_records, :user, index: true
    add_reference :workout_sessions, :user, index: true
  end
end
