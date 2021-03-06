Rails.application.routes.draw do
  resources :order_items
  resources :items
  resources :orders
  resources :accounts
  devise_for :users, controllers: {omniauth_callbacks: "callbacks"}

  root 'users#home'

  get "/account/:id/orders", to: "accounts#orders", as: "user_account"
  get "/account/:id/payment", to: "accounts#payment", as: "user_payment"
  post "/account/:id/payment", to: "accounts#create_payment", as: "user_create_payment"
  get "/account/:id/pallets", to: "accounts#pallets", as: "user_pallets"
  post "/account/:id/pallets", to: "accounts#return_pallets", as: "user_return_pallets"

  get "/books", to: "accounts#books", as: "books"
end
