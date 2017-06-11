class SessionsController < ApplicationController
	def login 
		@user = User.find_by_email(params[:user][:email])
		if @user && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
			redirect_to "/dash"
		else
			flash[:errors] = "problem logging in please try again....."
			redirect_to :back
		end
	end

	

	def destroy
		session[:user_id] = nil
		redirect_to "/"
	end
end


# def destroy #Logs User out -- sets session[:user_id] to null -- redirects to login page
#     reset_session
#     redirect_to "/sessions/new"
#   end