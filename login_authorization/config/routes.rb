Rails.application.routes.draw do

  get 'sessions/new'

  post 'sessions' => 'sessions#create'
  
  get 'users/new'

  get 'users/:id' => 'users#show', as: 'user'

  get 'users/:id/edit' => 'users#edit'

  patch 'users/:id' => 'users#update'

  delete 'users/:id' => 'users#destroy'

  post 'users' => 'users#create'
end
