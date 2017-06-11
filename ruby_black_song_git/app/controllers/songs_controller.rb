class SongsController < ApplicationController
	before_action :require_login, only: [:index, :create, :destroy]
  def index
  	@user = User.where(id: 1)
  	puts '********9999000909090'
  	puts @user
  	@songs = Song.all
  	render 'index'
  end

  def show
  	@song = Song.find(params[:id])
  	# @users = Song.find(@song.id).users
  	@users = User.all
  	render 'show'
  end

  def create
  	@song = Song.create(title: params[:song][:title], artist: params[:song][:artist], user_id: params[:user_id])
  	# @count = Count.create(user_id: params[:user_id],song_id: @song.id)
  	@user = User.where(id: 1)
  	flash[:errors] = "Fields can't be blank"
  	
  	redirect_to '/songs'

  end

  private
  		def song_params
    		params.require(:song).permit(:title,:artist)
  		end
end
