Zooftware::Application.routes.draw do

  get "blog_entries/index"

  get "blog_entries/show"

  get "blog_entries/new"

  get "blog_entries/edit"

  devise_for :users
  match 'logout' => 'user_sessions#destroy', :as => :logout
  
  namespace :admin do

    resources :sites do 
      get :set_primary_domain, :on=>:member
    end
    resources :menu_groups do
      resources :menu_items
    end
    resources :pages
    resources :rooms
    resources :resources
    resources :promoted_groups do
      resources :promoted_items
    end
  

    match '/set_current_site/:id' => 'dashboard#set_current_site', :as=>:set_current_site
    root :to => "dashboard#index"
  end
  root :to => 'welcome#index'

end
