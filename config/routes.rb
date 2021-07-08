Rails.application.routes.draw do
  get 'comments/index'
  get 'search/index'
  get 'home/index'

  devise_for :users
  get 'posts/index'


  root to: 'posts#index'

  resources :posts, only: [:new, :create, :show, :destroy] do
    resources :comments, only: [:create, :destroy, :edit]
  end
  resources :users, only: [:show, :edit, :update]

  resources :followers, only: [:index]
  resources :followed_users, only: [:index]

  resources :follows, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
