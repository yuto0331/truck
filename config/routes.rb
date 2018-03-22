Rails.application.routes.draw do
  root 'users#top'
  resources :sessions, only: [:new, :create, :destroy, :show]
  resources :favorites, only: [:create, :destroy]
  resources :users
  # resources :restaurants do
  #   resources :comments
  # end
  resources :restaurants 
  resources :comments
  resources :preferences, only: [:create, :destroy]
  resources :baths
end
