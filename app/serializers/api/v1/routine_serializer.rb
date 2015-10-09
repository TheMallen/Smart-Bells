class Api::V1::RoutineSerializer < Api::V1::BaseSerializer
  has_one :user
  attributes(
    :name,
    :created_at,
    :updated_at,
    :is_public,
    :set_groups,
    :id
  )
end
