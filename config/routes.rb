Rails.application.routes.draw do
  root 'letters#index'
  scope module: :letters do
    resources :popular,  only: [:index]
  end
  resources :letters, only: [:create, :show] do
    resources :comments, only: [:create, :destroy] do
      resources :likes, only: [:create, :destroy]
    end
  end
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] do
    resources :books, only: [:index, :show, :new, :create, :destroy, :search]
  end
end
