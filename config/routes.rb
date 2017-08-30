Rails.application.routes.draw do

  root "welcome#index"

  get "/signup", to: "users#new", as: :signup
  get "/login", to: "sessions#new", as: :login
  post "/login", to: "sessions#create", as: :user_loggedin
  delete "/logout", to: "sessions#destroy", as: :logout

  resources :users, only: [:create, :show]

  get "/users/:id/gyms/search", to: "favoritegyms#search", as: :search_gyms
  post "/users/:id/gyms/search", to: "favoritegyms#google", as: :gyms
  get "/users/:id/gyms/new", to: "favoritegyms#new", as: :new_gym
  post "/users/:id", to: "favoritegyms#create", as: :save_gym
  delete "/users/:id/:gym_id", to: "favoritegyms#destroy", as: :delete_gym

end
