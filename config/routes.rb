# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'

  devise_scope :user do
    get 'sign_out', to: 'devise/sessions#destroy'
  end

  resources :users do
    member do
      get 'follow'
      get 'unfollow'
    end
  end

  resources :articles do
    resources :comments
  end
end
