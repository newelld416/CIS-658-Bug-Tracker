Rails.application.routes.draw do
  get 'welcome/index'

  resources :bugs

  root 'welcome#index'
end