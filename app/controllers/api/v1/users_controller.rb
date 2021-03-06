class Api::V1::UsersController < Api::V1::ResourceController
  before_filter :authenticate_user!, only: [:show, :update, :destroy]

  private

  def create_params
    params
      .require(:user)
      .permit(
        :email,
        :password,
        :password_confirmation,
        :username
      )
      .delete_if { |_k, v| v.nil? }
  end

  def update_params
    create_params
  end
end
