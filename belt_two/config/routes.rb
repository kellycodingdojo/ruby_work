Rails.application.routes.draw do
  root 'users#main'
  post '/register' => 'users#create'
  
  post '/login' => 'sessions#create'
  get '/dashboard' => 'sessions#dashboard'
  get  '/dashboard/:id' => 'sessions#dashboard' 
  post '/sell/:id' => 'products#create'
  delete 'destroy/:id' => 'products#destroy'
 
end



# get  '/dashboard/:id'  => 'users#show'