class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def restrict_access
    if !current_user
      flash[:alert] = "Please log in."
      redirect_to '/movies'
    end
  end

  def restrict_admin_access
    if current_user && !current_user.roles.include?("admin")
      flash[:alert] = "You aren't an admin, sorry."
      redirect_to '/movies'
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
