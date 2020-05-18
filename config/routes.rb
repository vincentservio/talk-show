Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations',  omniauth_callbacks: "omniauth_callbacks" }
                  
   resources :tv_shows do 
     resources :comments, only:[:index, :new, :create, :show, :edit, :update, :destroy]
   end
   
     resources :tv_shows, :comments, only:[:index, :new, :create, :show, :edit, :update, :destroy]
   
   
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

  root to: 'tv_shows#index'
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
