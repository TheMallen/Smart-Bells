class Api::V1::AchievementsController < Api::V1::BaseController
  before_filter :authenticate_user!

  protected

  def create_params
    params
      .require(:achievement)
      .permit :type,
              :name,
              :description,
              :user_id
  end

  def update_params
    create_params
  end
end
