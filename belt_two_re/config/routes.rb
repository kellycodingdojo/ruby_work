Rails.application.routes.draw do
  root 'users#main'
  post '/register' => 'users#create'
  delete '/sessions/:id' => 'sessions#destroy'
  post '/login' => 'sessions#create'
  get '/dashboard' => 'sessions#dashboard'
  get  '/dashboard/:id' => 'sessions#dashboard' 
  post '/sell/:id' => 'products#create'
  delete 'destroy/:id' => 'products#destroy'
  get '/all_product/:id'  => 'products#all_product'
  post '/dashboard/buy/:id' => 'sessions#buy'
   

end