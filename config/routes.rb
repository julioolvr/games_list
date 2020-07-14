# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users

  root to: 'games#index'
  resources :games

  namespace :admin do
    resources :users
    resources :platforms
    resources :reviews
    resources :games

    root to: 'users#index'
  end
end
