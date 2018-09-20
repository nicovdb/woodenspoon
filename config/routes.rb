Rails.application.routes.draw do
  devise_for :users
  root to: 'teams#index'
  resources :teams, only: [:index, :new, :show, :create]
  resources :users, only: [:new, :create]
  resources :jokes, only: [:new, :create]
  resources :teamusers, only: [:new, :create, :edit, :update]
  resources :likes, only: [:new, :create]
  get '/find', to: 'teams#find', as: 'find_team'
  get '/found', to: 'teams#found', as: 'found_team'
  get '/create-teamuser', to: 'teamusers#create_with_user_id', as: 'create_teamuser'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

