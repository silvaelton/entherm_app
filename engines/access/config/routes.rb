Access::Engine.routes.draw do

	resources :users, path: 'usuarios'
  resources :logs
end
