Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # GET /
  root to: "main#index"

  # GET /about
  get "about", to: "about#index"
end
