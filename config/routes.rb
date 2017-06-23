Rails.application.routes.draw do

	root 'promotions#index'
	
	resources :settings
	resources :products
	resources :promotions do
		resources :vendors
	end

	resources :notifications, only: [:new, :create]

	post 'notifications', to: 'notifications#create'
	get 'notifications/new', to: 'notifications#new'

	namespace :api do
		namespace :v1 do

			resources :promotions, only: [:show, :index] do
				get :vendors
			end

			resources :products, only: [:index]

			get 'notify', to: 'products#notify'

			get 'company_info', to: 'general#company_info'
		end
	end

end
