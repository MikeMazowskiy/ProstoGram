Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  get 'posts/index'

  root to: 'posts#index'
  resources :posts, only: [:new, :create]
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
