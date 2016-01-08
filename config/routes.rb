Rails.application.routes.draw do
  resources :notes
  resources :lessons
  resources :courses
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
