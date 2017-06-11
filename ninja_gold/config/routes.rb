Rails.application.routes.draw do
  root 'rpg#index'

  post 'gold' => 'rpg#gold'

  get 'reset' => 'rpg#reset'
end
