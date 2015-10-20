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
    collection do 
      get   'logs',     to: 'inventories#logs'
      get   'add_item', to: 'inventories#add_item'
      post  'add_item', to: 'inventories#increase_item'

      get   'remove_item', to: 'inventories#remove_item'
      post  'remove_item', to: 'inventories#decrease_item'
    end
  end

  resources :patrimonies
  resources :quotations

  get '/dashboard', path: 'visao-geral', to: 'dashboard#index', as: 'dashboard'
end
