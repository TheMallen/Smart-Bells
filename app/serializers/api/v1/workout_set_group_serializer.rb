class Api::V1::WorkoutSetGroupSerializer < Api::V1::BaseSerializer
  attributes(
    :resistance,
    :number_of_sets,
    :reps_per_set,
    :created_at,
    :updated_at,
    :exercise_name,
    :id
  )
  has_one :workout_session
  has_one :exercise

  def exercise_name
    object.exercise.name
  end
end
