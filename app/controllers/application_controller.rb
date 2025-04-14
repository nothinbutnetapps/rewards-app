class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def current_user
    @current_user ||= User.find_by(username: params[:username])
  end
end
