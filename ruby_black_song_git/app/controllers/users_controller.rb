class UsersController < ApplicationController
	before_action :require_login, except: [:new, :create]
  def new
  	session[:user_id] = nil
  end

  def show
  	@user = User.find(params[:id])
  	# @songs = User.find(@user.id).songs_counted
  	@songs = Song.all
  	render 'show'
  end

  def create
  	
    @user = User.create(first_name: params[:user][:first_name], last_name: params[:user][:last_name], email: params[:user][:email], password: params[:user][:password])
    session[:name] = @user.first_name
    session[:user_id] = @user.id
    	if @user.valid?
      	flash[:success] = "You are registered"
   	 	else
      	flash[:errors] = @user.errors.full_messages
    	end
    # redirect_to "/users/" + @user.id.to_s
    
    redirect_to '/users/new'
	end

	private
  		def user_params
    		params.require(:user).permit(:first_name,:last_name,:email,:password)
  		end
end
