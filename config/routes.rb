Rails.application.routes.draw do
  resources :reviews

  resources :users 
  resources :reservations

  resources :restaurants
  resources :cities

<<<<<<< HEAD
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
=======
  get '/login', to: 'sessions#new', as: "login"
  post '/login', to: 'sessions#create', as: "sessions"
  post 'signup', to: "users#new", as: "signup"
  post "/logout", to: "sessions#destroy", as: "logout"

>>>>>>> master
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end