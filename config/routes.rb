Rails.application.routes.draw do
  get "/welcome", to: "welcomes#index", as: :welcome
  root "welcomes#index"
end
