class ApplicationController < ActionController::Base
  
  # Used to correctly redirect after oauth sign in
  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || dashboard_path
  end

  def user_not_authorized
    redirect_back(fallback_location: root_path, allow_other_host: false)
    flash[:alert] = t 'errors.action_not_allowed'
  end
end
