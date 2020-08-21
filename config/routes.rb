Rails.application.routes.draw do
  resources :departments
  root to: "products#index"
  # get "products/new", to: "products#new"
  # post "products", to: "products#create"
  # delete "products/:id", to:"products#destroy", as: :product
  resources :products, only: [:new, :create, :edit, :update, :destroy]
  get "products/search", to: "products#search", as: :search_product
end
