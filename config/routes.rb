Rails.application.routes.draw do
  root "static_pages#home"

  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"
  post "/signup", to: "users#create"

  delete "/logout", to: "sessions#destroy"

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, except: [:index, :show, :destroy]
  resources :microposts, only: [:create, :destroy]
end
