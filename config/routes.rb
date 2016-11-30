Rails.application.routes.draw do
  devise_for :users
  get  '/home', to: 'static_pages#home'
  get  '/help', to: 'static_pages#help'
  resources :articles
  resources :users
  root 'static_pages#home'
end
