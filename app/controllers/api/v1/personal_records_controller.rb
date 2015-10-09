class Api::V1::PersonalRecordsController < Api::V1::ResourceController
  before_filter :authenticate_user!

  protected

  def create_params
    params
      .require(:personal_record)
      .permit :resistance,
              :user_id,
              :exercise_id
  end

  def update_params
    create_params
  end
end
