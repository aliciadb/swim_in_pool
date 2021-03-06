Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  delete "pools/:id", to: "pools#destroy", as: :delete_pool

  resources :pools, except: [:destroy] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: :destroy
  # resources :dashboards, only: :show
  get "dashboards", to: "dashboards#show"
  # root "articles#index"
end
