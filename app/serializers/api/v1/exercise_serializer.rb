class Api::V1::ExerciseSerializer < Api::V1::BaseSerializer
  has_one :user
  attributes(
  :id,
  :name,
  :increase_per_session,
  :created_at,
  :updated_at,
  :is_public
  )
end
