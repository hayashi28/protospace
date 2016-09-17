Rails.application.routes.draw do

  root 'prototypes#index'

  devise_for :users

  resources :prototypes do
    resources :likes, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]


end

