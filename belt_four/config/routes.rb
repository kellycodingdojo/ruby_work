Rails.application.routes.draw do
   root 'users#main'
   post '/register' => 'users#create'
  post '/login' => 'sessions#create'
  delete '/sessions/:id' => 'sessions#destroy'

  get '/songs' => 'users#show'
  post '/add_song' => 'songs#create'
  post '/add_list/:id' => 'playlists#create'
  post '/songs/:id' => 'songs#show'
  get '/songs/:id' => 'songs#show'

  get 'users/:id' => 'users#user'
get 'go_back/:id' => 'users#show'
  
end
