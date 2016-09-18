Rails.application.routes.draw do

  root 'prototypes#index'

  devise_for :users

  resources :prototypes do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  resources :users, only: [:show, :edit, :update]


end

