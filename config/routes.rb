Rails.application.routes.draw do
  resources :recipes
  devise_for :users, controllers: {
    sessions: "user/sessions",
    registrations: "user/registrations",
  }
  root "main#index"
end
