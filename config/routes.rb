Rails.application.routes.draw do
  get 'coupons/index'
  get 'coupons/show'
  get 'coupons/update'
  get 'coupons/create'
  get 'coupons/edit'
  get 'coupons/destroy'
  get 'businesses/index'
  get 'businesses/show'
  get 'businesses/update'
  get 'businesses/create'
  get 'businesses/edit'
  get 'businesses/destroy'
  resources :businesses do
    resources :coupons
  end
end
