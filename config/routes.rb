Rails.application.routes.draw do

  devise_for :users
  root "pages#index"

  get "about",    to: "pages#about"
  get "contact",  to: "pages#contact"
  get "users", 		to: "users#index"

  resources :posts do
  	resources :comments
  end
  
  resources :users, only: [:show]
  

 
end
