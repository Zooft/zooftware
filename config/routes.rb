Zooftware::Application.routes.draw do
  get "welcome/index"

  devise_for :users
  namespace :admin do

    root :to => "dashboard#index"
  end
  root :to => 'welcome#index'

end
