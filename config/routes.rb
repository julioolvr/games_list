# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users

  root to: 'games#index'
  resources :games

  namespace :admin do
    resources :games
    resources :reviews
    resources :users
    resources :groups
    resources :platforms

    root to: 'games#index'
  end
end
