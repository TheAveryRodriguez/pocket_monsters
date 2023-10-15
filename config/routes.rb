Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/trainers", to: "trainers#index"
  get "/trainers/new", to: "trainers#new"
  get "/trainers/:id", to: "trainers#show"
  post "/trainers", to: "trainers#create"
  get "/trainers/:id/edit", to: "trainers#edit"
  patch "/trainers/:id/", to: "trainers#update"

  get "/pocket_monsters", to: "pocket_monsters#index"
  get "/pocket_monsters/:id", to: "pocket_monsters#show"

  get "/trainers/:id/pocket_monsters", to: "trainer_pocket_monsters#index"
  get "/trainers/:id/pocket_monsters/new", to: "trainer_pocket_monsters#new"
  post "/trainers/:id/pocket_monsters", to: "trainer_pocket_monsters#create"
end
