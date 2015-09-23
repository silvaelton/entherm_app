Rails.application.routes.draw do
  devise_for :users

  mount Dashboard::Engine   => '/visao-geral',  as: 'dashboard'
  mount Commercial::Engine  => '/comercial',    as: 'commercial'
  mount Deal::Engine        => '/compras',	    as: 'deal'
  mount Access::Engine 		  => '/acesso', 			as: 'access'
end
