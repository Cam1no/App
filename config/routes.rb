Rails.application.routes.draw do
  namespace :article do
    get 'tags/create'
  end

  namespace :article do
    get 'tags/destroy'
  end

  namespace :article do
    resources :bases
  end
  devise_for :bases, class_name: 'User::Base', path: '/'
  root to: 'user/bases#index'
  namespace :user do
    resources :bases, only: %i[index edit update] do
      member do
        get :followings, :followers
      end
    end
    resources :relationships, only: %i[create destroy]
  end
  resources :like_articles, only: %i[create destroy]
end
