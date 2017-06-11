class UsersController < ApplicationController

def user
  @goober = User.find(params[:id])
  @songs = @goober.songs_added.group(:id).select(:title, :artist, "COUNT('id') as total")
  
end




	def create
    # if params[:user][:password] == params[:user][:password_confirmation]  <== the pass and pass conf took care of this. 
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to "/songs"
      else
        flash[:errors] = @user.errors.full_messages
        redirect_to "/users/main"
      end
  end

def show
	@user = User.find(current_user)
	@song = Song.all

end

# User.first.songs_added.group('songs.id').select(:title, :artist, "COUNT('songs.id') as TimesAdded")



private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end


end