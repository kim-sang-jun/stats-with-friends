Rails.application.routes.draw do
  root 'welcome#index'
  get '/login', to: 'login#index'

  resources :scores
end
