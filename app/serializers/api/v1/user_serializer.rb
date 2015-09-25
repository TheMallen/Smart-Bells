class Api::V1::UserSerializer < Api::V1::BaseSerializer
  attributes :id, :email, :username, :created_at, :updated_at

  # Set up associations for workouts
  has_many :workout_sessions
  has_many :personal_records
  has_many :routines
end
