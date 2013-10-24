Amco::Application.routes.draw do

  get "/new_purchase_order" => 'home#new_purchase_order'
  get "/product_thumbnails" => 'home#product_thumbnails'
  
  authenticated :user do
    root :to => 'home#index'
  end
  devise_for :users, :controllers => { :registrations => 'registrations' }
  devise_scope :user do
    root to: "devise/sessions#new"
    put 'update_plan', :to => 'registrations#update_plan'
  end

  resources :users
  resources :developers
  resources :job_sites do
    resources :phases do
      resources :lots
    end
  end
  resources :phases
  resources :lots
  
  resources :suppliers
  resources :supplier_products, :only => ["destroy"]
  
  resources :products
  resources :purchase_orders
  
  resources :events

end