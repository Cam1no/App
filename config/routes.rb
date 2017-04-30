Rails.application.routes.draw do
  namespace :article do
    resources :bases
    resources :tags, only: %i[create destroy]
  end
  devise_for :bases, class_name: 'User::Base', path: '/'
  root to: 'welcome#top'
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
