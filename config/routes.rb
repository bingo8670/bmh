Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations, :passwords => :passwords }

  # devise_scope :user do
  #   authenticated :user do
  #     root 'threats#index', as: :authenticated_root
  #     # get 'devise/passwords#edit'
  #   end
  #
  #   unauthenticated do
  #     root 'devise/sessions#new', as: :unauthenticated_root
  #   end
  # end
  root 'threats#index'

  namespace :admin do
    resources :threats
    resources :users do
      member do
        get :password
        patch :update_password
      end
      resource :profile, :controller => "user_profiles"
    end
  end

end
