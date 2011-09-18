Zooftware::Application.routes.draw do
  
  resources :events, :only=>[:index, :show], :path=>"event"

  resources :blog_entries, :only=>[:index, :show], :path=>"blog"

  resources :faq_entries, :only=>[:index], :path=>"faq"

  resources :pages, :only=>[:show], :path=>"p"

  devise_for :users
  devise_scope :user do
    get 'logout', :to => 'devise/sessions#destroy', :as => :logout
  end
  
  namespace :admin do

    resources :sites do 
      get :set_primary_domain, :on=>:member
    end
    resources :menu_groups do
      resources :menu_items
    end
    resources :pages
    resources :faq_entries
    resources :events
    resources :blog_entries
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
