Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
resources :application


     resources :comments
resources :tv_shows
  resources :tv_shows do 
     resources :comments, only:[:index,:new, :create, :show, :edit, :update]
  end

resources :tv_shows, path:"recent_tv_shows_path"  do 
  collection do 
    get :recent
  end 
end
resources :tv_shows, path:"most_comments_tv_shows_path"  do 
  collection do 
    get :most_comments
  end 
end

    # get '/tv_shows/:tv_show_id/comments', to:"comments#index" 
  root to: 'tv_shows#index'

  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
