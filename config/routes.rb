Rails.application.routes.draw do
  root 'letters#index'
  resources :letters, only: [:create, :show] do
    resources :comments, only: [:create, :destroy] do
      resources :likes, only: [:create, :destroy]
    end
  end
  devise_for :users
  resources :users, only: [:show, :edit, :update]
end
