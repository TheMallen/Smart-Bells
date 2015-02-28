class WorkoutSet < ActiveRecord::Base
  belongs_to :workout_session
  belongs_to :exercise
end
