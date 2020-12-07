module UsersHelper
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Confirms a logged-in user or redirect
  def logged_in_user                
    if !logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end

