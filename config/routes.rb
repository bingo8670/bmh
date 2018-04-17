Rails.application.routes.draw do
  devise_for :users
  root 'threats#index'
  resources :threats
end
