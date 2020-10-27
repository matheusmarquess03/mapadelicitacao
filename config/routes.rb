Rails.application.routes.draw do
  get 'biddings', to: 'biddings#reports'
  get 'certificates', to: 'certificates#reports'
 
  resources :certificates
  resources :biddings
  get 'home/index'
  root 'biddings#reports'
  root 'certificates#reports'
  
  
end
