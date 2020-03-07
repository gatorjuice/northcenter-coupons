# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  root 'businesses#index'

  resources :businesses do
    resources :coupons
  end
end
