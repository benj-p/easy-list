class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]

  def dashboard; end

  def home
    redirect_to dashboard_path if current_user # Home should only be available to unlogged users
    @home = true
  end
end