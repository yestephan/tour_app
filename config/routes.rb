Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :tours do
    resources :bookings, only: [:create]
  end
  resources :users, only: [:update, :destroy]

  get "/profile", to: "profiles#show"
  get "/profile/edit", to: "profiles#edit"
  patch "/profile", to: "profiles#update"
end
