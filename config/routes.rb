Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
resources :application


  resources :tv_shows do 
     resources :comments, only: [:new, :create]
  end
 
  resources :ingredients
  root to: 'tv_shows#index'

  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
