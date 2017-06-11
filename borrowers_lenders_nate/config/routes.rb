Rails.application.routes.draw do
  root 'sessions#new'

  get 'logout' => 'sessions#destroy'

  post 'login' => 'sessions#create'

  get 'register' => 'sessions#register'

  post 'transaction/:id' => 'lenders#transaction'

  get 'lenders/:id' => "lenders#show", as: "lender"

  post 'lenders' => 'lenders#create'

  get 'borrowers/:id' => 'borrowers#show', as: 'borrower'

  post 'borrowers' => 'borrowers#create'


end
