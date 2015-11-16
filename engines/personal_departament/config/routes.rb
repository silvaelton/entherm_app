PersonalDepartament::Engine.routes.draw do

  resources :staffs do 
    resources :dependents
    resources :attachments
    resources :annotations
  end

  resources :sectors
  resources :jobs
  
end
