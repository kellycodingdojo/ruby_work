class CountsController < ApplicationController
  def create
  	  @count = Count.create(user_id: session[:user_id],song_id: params[:song_id])
  	  puts'counts*************'
  	  puts params[:song_id]
	  puts params[:user_id]
	  puts session[:user_id]
	  puts '!!!!!!!'
  	  redirect_to '/songs'
  end
end
