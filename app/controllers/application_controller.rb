class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :cleanup_zombie_session, unless: :session_cleared?
  helper_method :user_signed_in?, :current_user  

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticate_user!
    redirect_to login_path unless current_user
  end

  def user_signed_in?
    current_user
  end
  
  private
  def session_cleared?
    user_signed_in? ||session[:user_id].nil?
  end

  def cleanup_zombie_session
    return unless User.find_by(id: session[:user_id]).nil?
  end
end

