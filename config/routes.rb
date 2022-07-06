Rails.application.routes.draw do
  namespace :admin do
      resources :posts
      resources :users
      resources :admin_users

      root to: "posts#index"
    end
  root to: 'static#homepage'
  resources :posts
  devise_for :users, skip: [:registrations]
  # devise_for :users do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end
end
