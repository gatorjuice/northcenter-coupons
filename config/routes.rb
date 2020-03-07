# frozen_string_literal: true

Rails.application.routes.draw do
  root 'businesses#index'

  resources :businesses do
    resources :coupons
  end
end
