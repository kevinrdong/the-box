class Admin::DetailsController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find params[:id]
		@orders = Order.includes(:ordered_items,:products).where(['pay=? and user_id=?',0,@user])
	end

end