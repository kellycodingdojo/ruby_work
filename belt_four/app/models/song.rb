class Song < ActiveRecord::Base
  belongs_to :user 
  has_many :playlists, dependent: :destroy
  has_many :listeners, through: :playlists, source: :user
 
end
 

# Song.find_by_sql("SELECT COUNT(users.id) as added, users.* FROM songs JOIN playlists ON playlists.song_id = songs.id JOIN users ON playlists.user_id = users.id WHERE songs.id = 4 GROUP BY users.id")

#<<<<<<< this is the raw sql query to get what you need, now you just have to build it out in the contoller. 
#<<<<<<<  if you wanted to use raw sql you would put it as method in the models. 

#<<< the "as added" is the column that we added to keep track of the number of time the song
#has been added to the users playlist. 