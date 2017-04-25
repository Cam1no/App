Rails.application.routes.draw do
  root to: 'user/bases#index'
  namespace :user do
    resources :bases do
      member do
       get :followings, :followers
      end
    end
    resources :relationships, only: [:create, :destroy]
  end
end
