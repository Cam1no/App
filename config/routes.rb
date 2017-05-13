Rails.application.routes.draw do
  mathjax 'mathjax'
  mount ActionCable.server => '/cable'
  resources :chat_rooms, only: %i[index new create show], module: 'chat'
  post 'chat_rooms/join', to: 'chat/chat_rooms#join', as: 'join_chat_room'

  resources :messages, only: %i[create], module: 'chat'

  namespace :ajax do
    namespace :article do
      resources :comments, only: %i[create]
      resources :likes, only: %i[create destroy]
    end
    namespace :user do
      resources :follows, only: %i[create destroy]
    end
  end

  namespace :article do
    resources :bases
    resources :tags, only: %i[create destroy]
  end
  devise_for :bases, class_name: 'User::Base', path: '/'
  root to: 'welcome#top'
  namespace :user do
    resources :bases, only: %i[index edit update show] do
      member do
        get :followings, :followers
      end
    end
  end
end
