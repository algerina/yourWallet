Rails.application.routes.draw do
  resources :bills
  resources :categories
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'home#index'
end
