class Admin::CommoditiesController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin	
	before_action :set_commodity , only: [:edit,:update,:destroy,:show,:undershelve]
	before_action :set_types, only: [:index,:edit,:create]
	
	def index				
	end

	def new
		@types = Type.includes(:products)
		@designers = Designer.all
		@product = Product.new	
	end

	def makenewtype
		@type  = Type.new		
		@types = Type.all
	end

	def newtype
		@types = Type.all
		@type = Type.create type_params

		if @type.save
		  redirect_to new_admin_commodity_path
		else

		  render :makenewtype
		end	

	end

	def destroy_type
		@type = Type.find(params[:id])
		if @type.destroy
			redirect_to admin_commodities_path
		end
		
	end

	def create
		@designers = Designer.all
		@product = Product.create product_params
		
		if @product.save
		  redirect_to admin_commodities_path
		else
		  render :new
		end	
		
	end

	def edit	
		@designers = Designer.all		
	end

	def update

		if @product.update product_params
		  redirect_to admin_commodities_path
		else
	   	  render :edit
		end	
		
	end

	def destroy

		if @product.destroy

			redirect_to admin_commodities_path
			
		end

	end

	def undershelve

		unshelve= {shelve:false}
		if @product.update unshelve

			redirect_to admin_commodities_path
			
		end

	end



	def show
		
	end


private

	def authenticate_admin
   		unless current_user.admin
			redirect_to products_path
		end
	end

	def product_params
		params.require(:product).permit(:name,:price,:description,:pictures,:image1,:image2,:image3,:image4,:type_id,:designer_id)		
	end

	def type_params
		params.require(:type).permit(:name)	
	end

	def set_commodity
		@product = Product.find params[:id]	
	end

	def set_types
		@types = Type.includes(:products)
	end

end
