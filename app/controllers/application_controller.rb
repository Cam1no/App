class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  helper_method :current_user

  def current_user
    if current_basis.nil?
      nil
    else
      current_basis
    end
  end

  private

  def authenticate_user!
    authenticate_basis!
  end
end
