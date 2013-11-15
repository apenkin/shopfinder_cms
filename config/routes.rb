ShopfinderCms::Engine.routes.draw do
  get "articles/page/:page" => "articles#index"
  get "items/page/:page" => "items#index"
  resources :articles, :only => [:show, :index]
  resources :items, :only => [:show, :index], :path => 'news'
end
