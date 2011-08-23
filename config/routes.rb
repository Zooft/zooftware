Zooftware::Application.routes.draw do

  get "welcome/index"

  devise_for :users
  match 'logout' => 'user_sessions#destroy', :as => :logout
  
  namespace :admin do
    root :to => "dashboard#index"
  end
  root :to => 'welcome#index'

end
