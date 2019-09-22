# Update on 07/15/2019 by Zhengqi
Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  get 'users/show'

  # Routes corresponding to Post, User, Following, Like created by Yi
  resources :images
  resources :posts
  resources :relationships, only: [:create, :destroy]
  devise_for :users

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :likes, only: [:create, :destroy]

  get 'welcome/index'
  root 'welcome#index'
  get  '/help',    to: 'welcome#help'
  get  '/about',   to: 'welcome#about'
  get  '/contact', to: 'welcome#contact'
  get  '/signup',  to: 'users#new'
  get  'users/:id', to: 'users#show', as: 'show_users'

  # Created & implemented by Pranay
	resources :posts do
	   resources :comments, only: [:create, :destroy]
  end

end

