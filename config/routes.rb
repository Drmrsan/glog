Rails.application.routes.draw do

  devise_for :users
  root "pages#index"

  get "about",    to: "pages#about"
  get "contact",  to: "pages#contact"
  get "users", 		to: "users#index"

  resources :posts do
  	member do
			put "like", 		to: "posts#upvote"
			put "dislike", 	to: "posts#downvote" 
  	end
  	resources :comments
  end
  
  resources :users, only: [:show]
  resources :categories
 
end
