class UserController < ApplicationController
  def find_or_create
    user = User.find_or_create_by!(username: params[:username])

    render json: user.to_json, status: :ok
  end

  private

  def params
    params.permit(:username)
  end
end
