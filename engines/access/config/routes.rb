Access::Engine.routes.draw do

	resources :users, path: 'usuarios'
  resources :logs
  resources :alerts, path: 'alertas'
end
