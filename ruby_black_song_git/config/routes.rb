Rails.application.routes.draw do
  post 'counts' => 'counts#create'

  get 'sessions/new'

  post 'sessions' => 'sessions#create'

  get 'songs' => 'songs#index'

  get 'songs/show'

  get 'users/new'

  get 'users/:id' => 'users#show'

  post 'users' => 'users#create'

  post 'songs' => 'songs#create'

  delete 'sessions/:id' => 'sessions#delete'

  get 'songs/:id' => 'songs#show'

  get 'users/:id' => 'users#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
