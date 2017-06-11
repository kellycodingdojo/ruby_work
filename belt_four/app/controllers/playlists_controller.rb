class PlaylistsController < ApplicationController

  def create 
    
    @list = Playlist.create list_params
    redirect_to '/songs'
  
end


private
    def list_params
      params.require(:list).permit(:song_id).merge(user: current_user)
    end


end
