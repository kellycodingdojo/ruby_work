class SongsController < ApplicationController

  def create
    @user = current_user
    @song = Song.new song_params
    if @song.save
      redirect_to "/songs"
    else
      flash[:errors] = @song.errors.full_messages
       redirect_to :back
    end
  end

  def show
    @my_user = User.find(current_user)
    @song = Song.find(params[:id])

    # @listeners = @song.listeners
    # @listeners = @song.listeners(:group => "id", :select => "id, COUNT(*) as count")
    # @listeners = @song.listeners.group('users.id as ')

    # @listeners = @song.listeners.select('user.*, COUNT(*) AS count').group('user.id')
    @listeners = @song.listeners.group(:id).select(:id, :first_name, :last_name, "COUNT(user_id) as count")



    # @listeners = @song.listeners.group(:id)  # >>>>>>>>>>>>>>>>>>>>>>>>>>>> sort of works, but oyu return a object with all the aggergate id's. 
    


    #Team.joins(:players).where("players.name LIKE 'Z%'").select("teams.name as team_name", "teams.*", "players.*")

    # @listeners = @song.listeners.joins(:users).where(playlist.song_id: :song.id).select("playlist.id").group("user_id")


  end
# Song.find_by_sql("SELECT COUNT(users.id) as added, users.* FROM songs JOIN playlists ON playlists.song_id = songs.id JOIN users ON playlists.user_id = users.id WHERE songs.id = 4 GROUP BY users.id")



private
    def song_params
      params.require(:song).permit(:title, :artist).merge(user: current_user)
    end
end


