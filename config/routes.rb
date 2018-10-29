Rails.application.routes.draw do
  namespace :admin do
    get 'application/index'
  end

  namespace :sysadmin do
    mount Resque::Server.new, at: '/resque'
  end
  
  devise_for :users
  resources :projects
  resources :tasks
  resources :comment
  get '/projects', to: 'projects#index'
  get '/about', to: 'about#index'
  get '/dashboard', to: 'dashboard#index'
  root 'dashboard#index'
  get '/comment/attachment/delete', to: 'comment#delete_attachment'
  delete '/comments/:task_id/attachments/:id', to: 'comment#delete_attachment', as: 'comment_attachment'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
