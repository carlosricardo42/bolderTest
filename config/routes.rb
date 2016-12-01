Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
     get "signup", to: "devise/registrations#new"
     get "login", to: "devise/sessions#new"
     get "logout", to: "devise/sessions#destroy"
  end
  get  '/home', to: 'static_pages#home'
  get  '/help', to: 'static_pages#help'
  resources :articles
  resources :users
  root 'static_pages#home'
end
