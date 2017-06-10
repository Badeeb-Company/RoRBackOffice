Rails.application.routes.draw do

	root 'promotions#index'
	
	resources :settings
	resources :products
	resources :promotions do
		resources :vendors
	end

	namespace :api do
		namespace :v1 do

			resources :promotions, only: [:show, :index] do
				get :vendors
			end

			resources :products, only: [:index]

			get 'company_info', to: 'general#company_info'
		end
	end

end
