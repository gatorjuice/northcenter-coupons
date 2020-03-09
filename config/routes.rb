# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  root 'businesses#index'

  get 'search' => 'businesses#search'

  resources :businesses do
    resources :coupons, shallow: true
  end
end
