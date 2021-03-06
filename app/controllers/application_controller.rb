class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys:[:last_name, :first_name ,:email, :password, :current_password])
  end

  private
  def user_not_authorized
     redirect_to(request.referrer || root_path, notice: 'You are not authorized to perform this action.')
  end
end
