Deal::Engine.routes.draw do
  resources :supplier_categories
  resources :suppliers
  resources :orders
  resources :control_orders
  resources :products
  resources :purchases do 
    get 'fpa'
  end

end
