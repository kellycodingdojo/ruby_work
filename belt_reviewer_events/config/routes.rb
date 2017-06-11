 Rails.application.routes.draw do
  root "users#index"
  post "register" => "users#register"
  post "login" => "sessions#login"
  get "dash" => "users#dash"
  post "create_event" => "events#create_event"
  get "events/:id" => "events#show" 
  post "events/join/:id" => "events#join" 
  post "comment" => "events#comment" 
  delete "destroy/:id" => "sessions#destroy" 
  get "user/:id" => "users#show"
  patch "user/:id/update" => "users#update"
  delete "events/destroy/:id" => "events#destroy"
  delete "join/cancel/:id" => "events#destroy_join"
  
  # # the :name param becomes options
  # get "say/hello(/:name)" => "displays#say"
  # get "times" => "displays#times"
  # get "times/restart" => "displays#restart"
end
