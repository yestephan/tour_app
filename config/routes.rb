Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :tours, only: [:index, :show]
  resources :users, only: [:show] do
    resources :tours, only: [:new, :create, :edit, :update]
    resources :bookings
  end
end
