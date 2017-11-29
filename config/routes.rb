Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions',:omniauth_callbacks => "users/omniauth_callbacks",registrations: 'users/registrations'   }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'products#index'
	resources :products ,only:[:index,:show]

	namespace :admin , path:"leanne" do
		 resources :commodities
		 resources :designers
		 resources :order,only:[:new,:create]
		 resources :details,only:[:index,:show,:destroy] do
		 	resources :order,only:[:destroy,:edit,:update]
		 end
		 resources :banners,only:[:index,:new,:create,:edit,:update,:destroy]
		 post   '/commodities/:id'  =>    'commodities#undershelve'
		 patch  '/commodities/:id'  =>    'commodities#notavailable', as:'not_available'
		 get '/newtype'        => 'commodities#makenewtype'
		 post '/newtype'       => 'commodities#newtype'
		 delete '/newtype/:id' => 'commodities#destroy_type', as:'destroy_type'


	end

		 get '/brand'          => 'products#brand' 
		 get '/designers'      => 'products#designers'
		 get '/contact'        => 'products#contact'
		 get '/order'	       => 'products#order'
		 get '/orders'	       => 'products#order_index'
		 get '/detail'         => 'products#detail', as: 'detail'
		 get '/agree'          => 'products#agree' ,as: 'agree'
		 post '/agree'         => 'products#agreed'

		 delete '/order/:id'   => 'products#item_destroy', as: 'item_destroy'
		 patch '/order/:id'    => 'products#update',as: 'ordered_item'
		 patch '/orders'		   => 'products#option', as: 'option'

end
