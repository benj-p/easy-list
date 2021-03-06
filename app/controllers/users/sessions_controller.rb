# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  after_action :remove_notice, only: [:destroy, :create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  # Moved to Application Controller to correctly redirect after oauth sign in
  # def after_sign_in_path_for(resource_or_scope)
  #   stored_location_for(resource_or_scope) || dashboard_path
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def remove_notice
    flash.discard(:notice)
  end
end
