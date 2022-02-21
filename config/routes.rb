Rails.application.routes.draw do
  get 'users/show'
  get 'bookings/index'
  get 'bookings/show'
  get 'bookings/new'
  get 'bookings/edit'
  get 'tours/index'
  get 'tours/show'
  get 'tours/new'
  get 'tours/edit'
  devise_for :users
  root to: 'pages#home'
  resources :tours, only: [:index, :show]
  resources :users, only: [:show] do
    resources :tours, only: [:new, :create, :edit, :update]
    resources :bookings
  end
end
