class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by_email(params[:user][:email])
		if @user && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id 
			redirect_to "/users/#{@user.id}"
		else
			flash[:errors] = ["Problem logging in please try again. "]
			redirect_to :back
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/login'
	end
end
