Rails.application.routes.draw do
  devise_for :bases, class_name: "User::Base", path: "/"
  root to: 'user/bases#index'
  namespace :user do
    resources :bases, only: [:index, :edit, :update] do
      member do
       get :followings, :followers
      end
    end
    resources :relationships, only: [:create, :destroy]
  end
end
