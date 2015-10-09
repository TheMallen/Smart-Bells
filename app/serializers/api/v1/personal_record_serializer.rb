class Api::V1::PersonalRecordSerializer < Api::V1::BaseSerializer
  attributes(
    :resistance, :created_at, :updated_at, :exercise_name
  )
  has_one :user
  has_one :exercise
end
