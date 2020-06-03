Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :carts, except: :show
  resources :users, except: [:show, :edit]
  resources :orders
  resources :cart_items
  resources :items do 
    resources :cart_items
  end
  resources :orders
  resources :items, only: [:show] do
    resources :images, only: [:create]
  end
  get '/contact', to: 'carts#contact'

  # Add pesonalized routes
  get '/mon_panier', to: 'carts#show', as: 'mon_panier'
  get '/mon_profil', to: 'users#show', as: 'mon_profil'
  get '/editer_mon_profil', to: 'users#edit', as: 'editer_mon_profil'
end