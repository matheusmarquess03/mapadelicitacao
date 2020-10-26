Rails.application.routes.draw do
  get 'biddings', to: 'biddings#reports'
  
  resources :certificates
  resources :biddings
  get 'home/index'
  root 'biddings#reports'
  
  
end
