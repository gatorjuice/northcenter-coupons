Rails.application.routes.draw do
  root 'businesses#index'

  resources :businesses do
    resources :coupons
  end
end
