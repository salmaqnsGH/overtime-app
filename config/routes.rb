Rails.application.routes.draw do
  root to: 'static#homepage'
  resources :posts
  devise_for :users, skip: [:registrations]
  # devise_for :users do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end
end
