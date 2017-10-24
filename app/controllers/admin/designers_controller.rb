class Admin::DesignersController < ApplicationController

	before_action :set_designer ,only:[:edit,:update,:destroy]

	def new
		@designer = Designer.new
	end

	def index
		@designers = Designer.all
	end

	def create
		@designer = Designer.new desginer_params

		if @designer.save
			redirect_to admin_designers_path
		else
			render :new			
		end
	end

	def edit
		
	end

	def update
		 
		if @designer.update desginer_params
			redirect_to admin_designers_path
		else
			render :edit			
		end		
	end

	def destroy
		if @designer.destroy
			redirect_to admin_designers_path
	    end
	end
	
private

	def set_designer
		@designer = Designer.find params[:id]
	end

	def desginer_params
		params.require(:designer).permit(:image,:name,:description)
	end
end
