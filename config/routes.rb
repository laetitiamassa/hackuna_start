Rails.application.routes.draw do
  resources :achievements
  resources :notes
  resources :lessons
  resources :courses
  root to: 'courses#index'
  devise_for :users
  resources :users

  get "about" => "visitors#about"
end
