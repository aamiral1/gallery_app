Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # GET /
  root "main#index"

  # GET /about
  get "about", to: "about#index"
end
