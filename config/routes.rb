Rails.application.routes.draw do
  devise_for :users
  root 'letters#index'
  resources :letters, only: [:create, :show]
  resources :users, only: [:show, :edit, :update]
end
