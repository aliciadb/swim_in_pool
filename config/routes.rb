Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pools#index"
  delete "pools/:id", to: "pools#destroy", as: :delete_pool

  resources :pools, except: [:index, :destroy] do
    resources :bookings, only: [:new, :create]
  end
  get "dashboards", to: "dashboards#show"
  # root "articles#index"
end
