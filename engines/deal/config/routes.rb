Deal::Engine.routes.draw do
  resources :supplier_categories
  resources :suppliers
  resources :orders
  resources :control_orders
  resources :products
  
  resources :purchases do 
    get 'fpa'
  end

  resources :inventories do 
    get 'in'
    get 'out'
  end

  resources :patrimonies
  resources :quotations

  get '/dashboard', path: 'visao-geral', to: 'dashboard#index', as: 'dashboard'
end
