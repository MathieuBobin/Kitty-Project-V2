Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :items do 
    resources :cart_items
  end
  resources :carts
  resources :orders
end