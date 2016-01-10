Rails.application.routes.draw do
  resources :achievements
  resources :notes
  resources :lessons
  resources :courses

  authenticated :user do
    #root to: 'courses#index', :as => "authenticated_root"
    #in the meantime, a welcome route
    root to: 'visitors#wait', :as => "authenticated_root"
  end

  root to: 'visitors#home'
  

  devise_for :users
  resources :users

  get "about" => "visitors#about"
end
