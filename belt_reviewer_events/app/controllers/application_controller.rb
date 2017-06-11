class ApplicationController < ActionController::Base

    def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
  protect_from_forgery with: :exception

  def require_login 
  	redirect_to '/' unless session[:user_id]
  end

  def require_correct_user
  	user = User.find(params[:id])
  	redirect_to current_user if current_user != user
  end

end

