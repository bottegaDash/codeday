class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  SIXTY_SECONDS_IN_MINUTE = 60

  def round_time start_time, end_time, round_by
    minutes = (end_time.to_i - start_time.to_i)/SIXTY_SECONDS_IN_MINUTE
    if minutes % round_by > 0
      minutes = ((minutes)/round_by)*round_by+round_by
    end
    minutes
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end
end
