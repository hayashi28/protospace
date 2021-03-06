class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  add_flash_types :success, :info, :warning, :danger
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource)
    user_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:nickname, :member, :profile, :works)
    devise_parameter_sanitizer.for(:sign_in).push(:nickname, :member, :profile, :works)
    devise_parameter_sanitizer.for(:account_update).push(:nickname, :member, :profile, :works)
  end
end
