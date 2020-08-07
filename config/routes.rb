Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #delete '/items/id', to: 'items#destroy', as: 'delete'
  resources :items do
    resources :bookings, only: [:create]
  end
  namespace :user do
    resources :items, only: [:index, :destroy]
    resources :bookings, only: :index
  end
  # resources :users, only: [:show]

  resources :bookings, only: [:show, :destroy, :update]
  
end
