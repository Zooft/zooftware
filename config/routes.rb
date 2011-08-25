Zooftware::Application.routes.draw do

  devise_for :users
  match 'logout' => 'user_sessions#destroy', :as => :logout
  
  namespace :admin do

    resources :sites do 
      resources :domains
    end
    resources :menu_groups do
      resources :menu_items
    end
  

    match '/set_current_site/:id' => 'dashboard#set_current_site', :as=>:set_current_site
    root :to => "dashboard#index"
  end
  root :to => 'welcome#index'

end
