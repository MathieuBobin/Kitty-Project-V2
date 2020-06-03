Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :carts
  resources :users
  resources :orders
  resources :cart_items
  resources :items do 
    resources :cart_items
  end
  resources :items, only: [:show] do
    resources :images, only: [:create]
  end
end