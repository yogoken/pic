Rails.application.routes.draw do
  root 'letters#index'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] do
    resources :books, only: [:index, :show, :new, :create, :destroy] do
      resources :impressions, only: [:create, :destroy]
    end
    resources :storages, only: [:create, :destroy]
  end
  scope module: :letters do
    resources :popular,  only: [:index]
  end
  resources :letters, only: [:create, :show, :destroy] do
    resources :comments, only: [:create, :destroy] do
      resources :likes, only: [:create, :destroy]
    end
  end
  resources :chat_groups, only: [:index, :new, :edit, :create, :update] do
    resources :messages, only: [:index, :create]
  end
  get 'admin' => 'admin/reports#index'
  namespace :admin do
    resources :users
  end
end
