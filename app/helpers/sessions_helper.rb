# frozen_string_literal: true

# Module SessionsHelper
module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  # Logs out the current user.
  def log_out
    session[:user_id] = nil
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
      user = User.find_by(id: user_id)
      log_in user
      @current_user = user
    end
  end

  def logged_in?
    !current_user.nil?
  end
end
