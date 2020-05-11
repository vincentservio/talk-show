Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' },
                      controllers: { omniauth_callbacks: "omniauth_callbacks"}





  resources :tv_shows do 
     resources :comments, only:[:index, :new, :create, :show, :edit, :update, :destroy]

end
     resources :comments
     resources :tv_shows
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

  delete '/tv_shows/:id', to:"tv_shows#destroy"

end

  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
