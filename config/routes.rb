Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'products#brand'
	resources :products ,only:[:index,:show]

	namespace :admin , path:"leanne" do
		 resources :commodities
		 resources :designers
		 resources :details,only:[:index,:show]
		 get '/newtype'        => 'commodities#makenewtype'
		 post '/newtype'       => 'commodities#newtype'
		 delete '/newtype/:id' => 'commodities#destroy_type'

	end

		 get '/brand'          => 'products#brand' 
		 get '/designers'      => 'products#designers'
		 get '/contact'        => 'products#contact'
		 get '/order'	       => 'products#order'
		 get '/orders'	       => 'products#order_index'
		 get '/detail'         => 'products#detail', as: 'detail'

		 delete '/order/:id'   => 'products#item_destroy', as: 'item_destroy'
		 patch '/order/:id'    => 'products#update',as: 'ordered_item'
		 patch '/orders'		   => 'products#option', as: 'option'

end
