Rails.application.routes.draw do
  root "xmens#index"




  # 7 restful routes
  resources :xmens
  # get "xmens" => "xmens#index"
  # get "xmens/new" => "xmens#new"
  # post "xmens" => "xmens#create"
  # get "xmens/:id" => "xmens#show"
  # get "xmens/:id/edit" => "xmens#edit"
  # patch "xmens/:id" => "xmens#update"
  # delete "xmens/:id" => "xmens#destroy"
end
