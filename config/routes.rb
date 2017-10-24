Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'products#index'
	resource :products ,only:[:index,:show]

	namespace :admin , path:"leanne" do
		 resources :commodities
		 resources :designers
		 get '/newtype'    => 'commodities#makenewtype'
		 post '/newtype'   => 'commodities#newtype'
		 delete '/newtype/:id' => 'commodities#destroy_type'
	end

		 get '/brand'     => 'products#brand' 
		 get '/designers' => 'products#designers'
		 get '/contact'   => 'products#contact'

end
