class Api::V1::AchievementSerializer < Api::V1::BaseSerializer
  attributes(
    :type,
    :name,
    :description,
    :created_at,
    :user_id,
    :updated_at
  )
end
