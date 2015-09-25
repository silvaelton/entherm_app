Deal::Engine.routes.draw do
  resources :supplier_categories
  resources :suppliers
  resources :orders
  resources :control_orders
  resources :products
  resources :purchases do 
<<<<<<< HEAD
    collection do 
      get '/fpa', to: 'purchases#fpa'
    end
  end
=======
    get 'fpa'
  end
  resources :inventories
  resources :patrimonies
  resources :quotations

  get '/dashboard', path: 'visao-geral', to: 'dashboard#index', as: 'dashboard'
>>>>>>> 1cda194092f1e8e609ec84fd472dfad7077ca626
end
