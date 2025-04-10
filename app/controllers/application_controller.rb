class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by(username: params[:username])
  end
end
