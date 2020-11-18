Rails.application.routes.draw do

  resources :kind_of_services
  resources :services
  resources :companies
	get 'prospection', to: 'biddings#prospection'
	get 'biddings', to: 'biddings#reports'
    get 'biddings/:id/check', to: 'biddings#check', as: 'check_bidding'
	get 'certificates', to: 'certificates#reports'
    delete 'biddings/:id/destroy_attachment', to: 'biddings#destroy_attachment', as: 'destroy_attachment_bidding'
	resources :certificates
	resources :biddings do
		collection {post :import }
	end
	resources :certificates do
		collection {post :import }
	end
	#resources :biddings do
	#	get 'biddings/', to: 'biddings#index', as: 'biddings'
	#	get 'biddings/new', to: 'biddings#index', as: 'new_bidding'
	#	post 'biddings/', to: 'biddings#create'
	#	get 'biddings/:id', to: 'biddings#show', as: 'bidding'
	#	get 'biddings/:id/edit', to: 'biddings#edit', as: 'edit_bidding'
	#	patch 'biddings/:id', to: 'biddings#update'
	#	delete 'biddings/:id', to: 'biddings#destroy'
	#	get 'biddings/:id/check', to: 'biddings#check', as: 'check_bidding'
	#end

  
  
	get 'home/index'
	root 'biddings#prospection'
  
end
