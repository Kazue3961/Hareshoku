Rails.application.routes.draw do

  devise_for :members, controllers: {
  sessions:      'members/sessions',
  passwords:     'members/passwords',
  registrations: 'members/registrations'
  }

  scope module: :members do
    root 'home#top'
    get 'home/top' => 'home#top'
    get 'about' => 'home#about', as: 'about'
    get 'search' => 'home#search', as: 'search'
    patch 'members/withdraw' => 'members#withdraw'
    put 'members/withdraw' => 'members#withdraw'
    resources :members, only: [:show, :edit, :update]
    resources :posts
    resources :favorites, only: [:index, :create, :destroy]
    resources :comments, only: [:index, :create, :destroy]
    resources :events, only: [:index]
  end

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }

  namespace :admins do
    get 'top' => 'home#top', as: 'top'
    resources :seasons, only: [:index, :create, :edit, :update, :destroy]
    resources :events
    resources :members, only: [:index, :show, :edit, :update]
  end

end