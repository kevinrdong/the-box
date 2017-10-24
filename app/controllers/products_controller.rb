class ProductsController < ApplicationController


	def index	
	end

	def show

		@types = Type.includes(:products)
		
	end

	def brand	
	end

	def designers	
		@designers = Designer.all	
	end

	def contact	
	end
end
