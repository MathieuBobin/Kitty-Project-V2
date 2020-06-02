Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :carts
  resources :users
  resources :cart_items
  resources :items do 
    resources :cart_items
  end
  resources :orders
end