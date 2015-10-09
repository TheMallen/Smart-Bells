class Api::V1::WorkoutSessionSerializer < Api::V1::BaseSerializer
  has_many :workout_set_groups
end
