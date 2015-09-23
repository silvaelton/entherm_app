Information::Engine.routes.draw do

  get '/cities', to: 'addresses#cities'
end
