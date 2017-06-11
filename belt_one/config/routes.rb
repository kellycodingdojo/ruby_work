Rails.application.routes.draw do
   root "users#index"
   post "register/lender" => "users#register_lend"
   post "register/borrower" => "users#register_borrow"
   get "lend/:id" => "users#lend" 
   get "borrow/:id" => "users#borrow"
   get "login" => "users#login_page"
   post "logging" => "sessions#login"

end
