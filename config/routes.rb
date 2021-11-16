Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :flats do
    collection do
      get 'myflats'
    end

    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :edit, :update] do
    collection do
      get :mybookings
    end
    member do
      patch 'respond'
    end
    resources :reviews, only: [:new, :create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
