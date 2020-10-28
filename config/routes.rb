Rails.application.routes.draw do
  get 'prospection', to: 'biddings#prospection'
  get 'biddings', to: 'biddings#reports'
  get 'certificates', to: 'certificates#reports'
 
  resources :certificates
  resources :biddings

  get 'home/index'
  root 'biddings#reports'
  
end
