class UsersController < ApplicationController
  def new
  end

  def create
  	if User.exists?(username: params[:user][:username])
  		@user = User.find_by(username: params[:user][:username])
  		session[:user_id] = @user.id
  		redirect_to "/messages"
  	else
  		@user = User.new(user_params)
  		if @user.save
	  		session[:user_id] = @user.id
  			redirect_to "/messages"
  		else
  			flash[:errors] = @user.errors.full_messages
  			redirect_to :back
  		end
  	end
  end

  def logout
  	reset_session
  	redirect_to '/login'
  end


  private
  def user_params
  	params.require(:user).permit(:username)
  end
end
