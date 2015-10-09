class Api::V1::WorkoutSessionSerializer < Api::V1::BaseSerializer
  has_many :workout_set_groups
  has_one :user
  attributes(
    :id,
    :user_id,
    :name,
    :created_at,
    :updated_at
  )

end
