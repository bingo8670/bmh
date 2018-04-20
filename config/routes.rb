Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }

  devise_scope :user do
    authenticated :user do
      root 'admin/threats#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  namespace :admin do
    resources :threats
    resources :users do
      resource :profile, :controller => "user_profiles"
    end
  end

end
