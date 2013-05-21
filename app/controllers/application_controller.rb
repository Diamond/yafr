class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def current_user
    begin
      user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
      user = nil
    end
  end
  helper_method :current_user
end
