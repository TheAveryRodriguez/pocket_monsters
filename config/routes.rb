Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/trainers", to: "trainers#index"
  get "/trainers/:id", to: "trainers#show"

  get "/pocket_monsters", to: "pocket_monsters#index"
  get "/pocket_monsters/:id", to: "pocket_monsters#show"

  get "/trainers/:trainer_id/pocket_monsters", to: "trainer_pocket_monsters#index"
end
