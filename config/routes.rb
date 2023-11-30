Rails.application.routes.draw do
  resources :foods
  resources :names
  resources :recipes
  resources :private_recipes, only: %i[index show]
  devise_for :users, controllers: {
    sessions: "user/sessions",
    registrations: "user/registrations",
  }
  root "main#index"
end
