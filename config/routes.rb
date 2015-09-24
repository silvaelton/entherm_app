Rails.application.routes.draw do
  
  root 'dashboard/generals#index'
 
  devise_for :users, controllers: {
    sessions: 'sessions',
    registrations: 'registrations'
  }
  
  mount Dashboard::Engine   => '/visao-geral',  as: 'dashboard',    module: 'dashboard'
  mount Commercial::Engine  => '/comercial',    as: 'commercial',   module: 'commercial'
  mount Deal::Engine        => '/compras',	    as: 'deal',         module: 'deal'
  mount Access::Engine      => '/acesso',       as: 'access',       module: 'access'
  mount Information::Engine => '/info',    			as: 'information',  module: 'information'
end
