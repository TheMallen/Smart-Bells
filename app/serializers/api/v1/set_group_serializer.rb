class Api::V1::SetGroupSerializer < Api::V1::BaseSerializer
  has_one :exercise
  has_one :routine
  attributes(
    :id,
    :created_at,
    :updated_at,
    :number_of_sets,
    :reps_per_set,
    :exercise
  )
end
