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
  resources :letters, only: [:create, :show] do
    resources :comments, only: [:create, :destroy] do
      resources :likes, only: [:create, :destroy]
    end
  end
  get 'admin' => 'admin/top#index'
end
