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
		if current_user.admin?
			redirect_to admin_commodities_path
		else
			redirect_to products_path
		end
	end

end