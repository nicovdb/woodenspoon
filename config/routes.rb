Rails.application.routes.draw do
  devise_for :users
  root to: 'teams#index'
  resources :teams, only: [:index, :new, :show, :create]
  resources :users, only: [:new, :create]
  resources :jokes, only: [:new, :create]
  resources :teamusers, only: [:new, :create]
  resources :likes, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
