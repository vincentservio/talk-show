Rails.application.routes.draw do
  
  resources :tv_shows
devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'tv_shows#index'

  resources :comments
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
