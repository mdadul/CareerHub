Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', password: 'password', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'signup' }, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  root 'home#index'

end
