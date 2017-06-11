class SessionsController < ApplicationController

  def new #Render Login page

  end

  def create #Log User in with authenticate -- generates flash messages errors
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = ["Invalid Combination"]
      redirect_to "/sessions/new"
    end
  end

  def destroy #Logs User out -- sets session[:user_id] to null -- redirects to login page
    reset_session
    redirect_to "/sessions/new"
  end

end
