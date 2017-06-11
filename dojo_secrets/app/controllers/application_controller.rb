class ApplicationController < ActionController::Base
  before_action :require_login, except: [:new, :create]
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  private
    def require_login
      unless logged_in
        flash[:error] = "You must be logged in to access this section"
        redirect_to "/sessions/new"
      end
    end

    def logged_in
      !!current_user
    end

end
