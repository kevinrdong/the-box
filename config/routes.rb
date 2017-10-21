Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'products#index'
	resource :products ,only:[:index,:show]

	namespace :admin , path:"leanne" do
		resource :products
	end

get '/brand' => 'products#brand' 
get '/designers' => 'products#designers'
get '/contact' => 'products#contact'
end
