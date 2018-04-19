Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }
  root 'threats#index'

  namespace :admin do
    resources :threats
    resources :users do
      resource :profile, :controller => "user_profiles"
    end
  end

end
