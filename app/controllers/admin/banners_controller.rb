class Admin::BannersController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin
	before_action :set_banner ,only:[:edit,:update,:destroy]	


	def index
		@banner = Banner.first
	end

	def new
		@banner = Banner.new
	end

	def create
		@banner = Banner.new banner_params

		if @banner.save
			redirect_to admin_banners_path
		else
			render :new			
		end		
	end

	def edit
		
	end

	def update
		if @banner.update banner_params
			redirect_to admin_banners_path
		else
			render :edit			
		end			
	end

	def destroy
		if @banner.destroy
			redirect_to admin_banners_path
	    end		
	end

private


	def authenticate_admin
   		unless current_user.admin
			redirect_to products_path
		end
	end

	def banner_params
		params.require(:banner).permit(:banner1,:banner2,:banner3)	
	end

	def set_banner
		@banner = Banner.find params[:id]
	end

end