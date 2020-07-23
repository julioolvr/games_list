# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'auth/sessions', registrations: 'auth/registrations', invitations: 'auth/invitations'
             }
  devise_for :admin_users, controllers: { sessions: 'auth/sessions' }

  root to: 'games#index'

  resources :games
  resources :reviews, only: %i[create update]

  namespace :admin do
    resources :games
    resources :reviews
    resources :users
    resources :groups
    resources :platforms

    root to: 'games#index'
  end
end
