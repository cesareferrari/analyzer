Rails.application.routes.draw do
  resources :customers, only: [:index]
  get "/welcome", to: "welcomes#index", as: :welcome
  root "welcomes#index"
end
