Rails.application.routes.draw do
  resources :customers, only: [:index] do
    collection do
      post :import
    end
  end

  get "/welcome", to: "welcomes#index", as: :welcome
  root "welcomes#index"
end
