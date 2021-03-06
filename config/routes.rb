Rails.application.routes.draw do
  namespace :admin do
    get 'application/index'
  end
  devise_for :users
  resources :projects
  resources :tasks
  resources :comment
  get '/projects', to: 'projects#index'
  get '/about', to: 'about#index'
  get '/dashboard', to: 'dashboard#index'
  root 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
