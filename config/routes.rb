Rails.application.routes.draw do

  resources :recipes do
    resources :ingredients
  end
  resources :foods
  get 'public_recipes', to: 'recipes#public_recipes'
  get 'general_shopping_list', to: 'main#shopping_list'
  root 'recipes#public_recipes'
  devise_for :users
end
