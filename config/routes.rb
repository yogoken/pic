Rails.application.routes.draw do
  root 'letters#index'
  resources :letters, only: [:create, :show] do
    resources :comments, only: [:create, :destroy] do
      resources :likes, only: [:create, :destroy]
    end
  end
  resources :users, only: [:show, :edit, :update]
  devise_for :users
end
