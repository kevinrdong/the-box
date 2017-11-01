class Admin::DetailsController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin
	def index
		@users = User.all
	end

	def show
		@user = User.find params[:id]
		@orders = Order.includes(:ordered_items,:products).where(['pay=? and user_id=?',0,@user])
	end

private


	def authenticate_admin
   		unless current_user.admin
			redirect_to products_path
		end
	end

end