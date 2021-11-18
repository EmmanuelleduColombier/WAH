Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :flats do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:edit, :update] do
    collection do
      get :dashboard
    end
    member do
      patch 'accept'
    end
    member do
      patch 'decline'
    end
    resources :reviews, only: [:new, :create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
