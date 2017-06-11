class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	if session[:user_id]
	  	if session[:type] == "borrower"
	  		return Borrower.find(session[:user_id])
	  	elsif session[:type] == "lender"
	  		return Lender.find(session[:user_id])
	  	else
	  		return nil
	  	end
	  end 
  end

	helper_method :current_user 

end
