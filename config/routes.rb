Rails.application.routes.draw do
  
  resources :subscriptions
  resources :achievements
  resources :notes
  resources :lessons
  resources :courses
  resources :charges

  authenticated :user do
    #root to: 'courses#index', :as => "authenticated_root"
    #in the meantime, a welcome route
    root to: 'courses#index', :as => "authenticated_root"
  end

  root to: 'visitors#home'
  
  devise_for :users
  resources :users

  get "about" => "visitors#about"

  #in order to make stripe work
  post '/buy/:id', to: 'charges#create', as: :buy
end
