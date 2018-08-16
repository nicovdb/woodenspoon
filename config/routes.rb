Rails.application.routes.draw do
  root to: 'teams#index'
  resources :teams, only: [:index, :new, :show, :create]
  resources :users, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
