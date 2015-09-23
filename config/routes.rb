Rails.application.routes.draw do
  
  root 'dashboard/generals#index'
 
  devise_for :users, controllers: {
    sessions: 'sessions',
    registrations: 'registrations'
  }
  
  mount Dashboard::Engine   => '/visao-geral',  as: 'dashboard'
  mount Commercial::Engine  => '/comercial',    as: 'commercial'
  mount Deal::Engine        => '/compras',	    as: 'deal'
  mount Access::Engine      => '/acesso',       as: 'access'
  mount Information::Engine => '/info',    			as: 'information' 
end
