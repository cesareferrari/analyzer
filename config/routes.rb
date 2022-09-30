Rails.application.routes.draw do
  resources :dashboards, only: [:index]
  resource :session, only: [:new, :create, :destroy]
  resources :users
  resources :orders, only: [:index] do
    collection do
      post :import
    end
  end

  resources :products, only: [:index] do
    collection do
      post :import
    end
  end

  resources :customers, only: [:index] do
    collection do
      post :import
    end
  end

  get "/welcome", to: "welcomes#index", as: :welcome
  root "welcomes#index"
end
