Amco::Application.routes.draw do

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
  resources :job_sites
  resources :suppliers
  resources :supplier_products, :only => ["destroy"]
  
  resources :products
  resources :purchase_orders
end