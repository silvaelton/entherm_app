Deal::Engine.routes.draw do
  resources :supplier_categories
  resources :suppliers
  resources :orders
  
  resources :control_orders do 
    resources :order_comments
  end
  resources :products
  
  resources :purchases do 
    get 'fpa'
  end

  resources :inventories, path: 'estoque'
  
  resources :inventory_logs, path: 'logs' do 
    collection do 
      get 'add_item'
      get 'remove_item'
    end
  end

  resources :patrimonies
  resources :patrimony_moviments do 
    get 'view'
  end
  
  resources :quotations

  get '/dashboard', path: 'visao-geral', to: 'dashboard#index', as: 'dashboard'
end
