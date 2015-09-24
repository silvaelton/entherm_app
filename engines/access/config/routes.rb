Access::Engine.routes.draw do

	resources :users do 
    resources :permissions
  end

  resources :logs
end
