Rails.application.routes.draw do

  root 'dojos#index'

  get 'dojos/index'

  get 'dojos/new'

  get 'dojos/:id' => 'dojos#show'

  get 'dojos/:id/edit' => 'dojos#edit'

  patch 'dojos/:id' => 'dojos#update'

  delete 'dojos/:id' => 'dojos#destroy'

  post 'dojos' => 'dojos#create'

end
