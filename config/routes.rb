Rails.application.routes.draw do
 
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  authenticated :user do
    root to: 'categories#index', as: :authenticated_root
  end

  resources :categories, only: [:new, :create, :index] do
    resources :bills, only: [:new, :create, :index]
  end

  root to: 'splash#index'
end
