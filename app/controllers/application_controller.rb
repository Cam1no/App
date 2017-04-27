class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_user, :signed_in?

  def current_user
    if current_basis.nil?
      nil
    else
      current_basis
    end
  end

  def signed_in?
    !current_user.nil?
  end

  private

  def authenticate_user!
    authenticate_basis!
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
