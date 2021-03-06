class Api::V1::SessionsController < Api::V1::BaseController
  def create
    user = User.find_by email: create_params[:email]
    user ||= User.find_by username: create_params[:username]
    if user && user.authenticate(create_params[:password])
      user.new_authentication_token!
      self.current_user = user
      render(
        json: Api::V1::SessionSerializer.new(user, root: false).to_json,
        status: 201
      )
    else
      return api_error status: 401
    end
  end

  private
  def create_params
    params.require('credentials').permit(:email, :username, :password)
  end

end
