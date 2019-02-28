Rails.application.routes.draw do
  get 'welcome/index'

  resources :bugs
  resources :users

  root 'welcome#index'
end