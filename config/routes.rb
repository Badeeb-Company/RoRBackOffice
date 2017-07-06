Rails.application.routes.draw do

  devise_for :users
	root 'promotions#index'
	
	resources :settings

	resources :products do
		collection do
			get 'import'
			post 'do_import'
		end

	end

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

			resources :notifications, only: [:index]

			get 'notify', to: 'products#notify'

			get 'company_info', to: 'general#company_info'
		end
	end

end
