Rails.application.routes.draw do
  resources :line_items, only: [:index] do
    collection do
      post :import
    end
  end

  resources :dashboards, only: [:index]
  resource :session, only: [:new, :create, :destroy]
  resources :users

  resources :orders, only: [:index, :show] do
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
