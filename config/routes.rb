Rails.application.routes.draw do
  get 'comments/index'
  get 'search/index'
  get 'home/index'
  get 'feed_posts/index' => 'feed_posts#index', as: :feed
  devise_for :users
  get 'posts/index'


  root to: 'posts#index'

  resources :posts, only: [:new, :create, :show, :destroy] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy, :edit]
  end
  resources :likes, only: [:create, :destroy]
  resources :users, only: [:show, :edit, :update]

  resources :feed_posts, only: [:index]

  resources :followers, only: [:index]
  resources :followed_users, only: [:index]

  resources :follows, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
