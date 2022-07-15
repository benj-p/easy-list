class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]

  def dashboard; end

  def home
    @home = true
  end
end
