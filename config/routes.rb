ShopfinderCms::Engine.routes.draw do
  resources :articles, :only => [:show, :index]
  resources :items, :only => [:show, :index], :path => 'novosti'
end
