Rails.application.routes.draw do
  resources :comments
  resources :tv_shows
devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'application#home'
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
