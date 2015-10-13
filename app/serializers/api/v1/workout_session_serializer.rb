class Api::V1::WorkoutSessionSerializer < Api::V1::BaseSerializer
  has_one :user
  attributes(
    :id,
    :user_id,
    :name,
    :created_at,
    :updated_at,
    :workout_set_groups
  )

end
