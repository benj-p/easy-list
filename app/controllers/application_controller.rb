class ApplicationController < ActionController::Base
  def user_not_authorized
    redirect_back(fallback_location: root_path, allow_other_host: false)
    flash[:alert] = t 'errors.action_not_allowed'
  end
end
