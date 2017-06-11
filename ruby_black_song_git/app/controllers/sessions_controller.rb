class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		session[:name] = user.first_name
  		# redirect_to "/users/" + user.id.to_s
  		@user = user
  		puts '***********'
  		puts @user.first_name
  		puts @user.id
  		@songs = Song.all
  		redirect_to '/songs'
  		# render 'songs/index.html.erb'
  	else 
  		flash[:errors] = "Invalid combination"
  		redirect_to '/users/new'
  	end
  end

  def delete
  	session[:user_id] = nil
  	redirect_to '/users/new'
  end
end
