Rails.application.routes.draw do
	root "users#index"
  get "users" => "users#index"
  get "users/new" => "users#new"
  get "users/total" => "users#total"
  get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit"
  patch "users/:id" => "users#update"
  post "users" => "users#create"
end