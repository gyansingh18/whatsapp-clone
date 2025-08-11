class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :current_user
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:alert] = "You must be logged in to perform this action"
      redirect_to login_path
    end
  end

  def redirect_if_logged_in
    if logged_in?
      redirect_to chats_path
    end
  end
end
# Performance optimization note 1: Mon Aug 11 10:16:58 IST 2025
# Performance optimization note 6: Mon Aug 11 10:16:58 IST 2025
# Performance optimization note 11: Mon Aug 11 10:16:59 IST 2025
# Performance optimization note 16: Mon Aug 11 10:17:00 IST 2025
# Performance optimization note 21: Mon Aug 11 10:17:00 IST 2025
# Performance optimization note 26: Mon Aug 11 10:17:01 IST 2025
# Performance optimization note 31: Mon Aug 11 10:17:02 IST 2025
# Performance optimization note 36: Mon Aug 11 10:17:02 IST 2025
# Performance optimization note 41: Mon Aug 11 10:17:03 IST 2025
# Performance optimization note 46: Mon Aug 11 10:17:04 IST 2025
