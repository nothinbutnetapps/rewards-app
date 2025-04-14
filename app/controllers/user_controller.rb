class UserController < ApplicationController
  def create
    user = User.create!(username: "User_#{SecureRandom.uuid}")

    render json: user.to_json, status: :ok
  end

  def show
    render json: User.find_by(username: params[:id]).to_json, status: :ok
  end
end
