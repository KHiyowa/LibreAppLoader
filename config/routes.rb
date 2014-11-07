Rails.application.routes.draw do
  root 'top#index'

  resource :top, only: [:index]
  resource :login
  resources :users, only: [:index, :edit]
  resources :groups, only: [:index, :show, :new, :edit]
  get "games/search" => "games#search"
  resources :games, only: [:index, :show, :new, :edit]

  namespace :admin do
    resources :users, only: %i(index edit new)
  end
end
