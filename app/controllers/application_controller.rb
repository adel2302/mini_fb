class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!
  protected
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def after_sign_in_path_for user
	 "/"
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
