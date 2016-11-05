Rails.application.routes.draw do
  root 'letters#index'
  resources :letters, only: [:index, :create, :show]
end
