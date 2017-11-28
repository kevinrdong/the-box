class Admin::OrderController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin
	before_action :find_order,only:[:edit,:update]
	before_action :set_user,only:[:edit,:update]

	def new
		@work = Work.first
	end

	def create
		work = Work.first
		if work.working
			work.working = false
			work.save
			redirect_to admin_commodities_path
		else
			work.working = true
			work.save			
			redirect_to admin_commodities_path
		end
	end

	def destroy
		order = Order.where('user_id=?',params[:detail_id]).find(params[:id])
		user = User.find params[:detail_id]
		order.cancel = true
		if order.save
			NewOrderMailer.cancel_order(user,order).deliver
			redirect_to admin_detail_path(params[:detail_id])
		end
	end

	def edit
	end

	def update
		@order.done = true
		if @order.update order_params
			NewOrderMailer.order_done(@user,@order).deliver
			redirect_to admin_detail_path(params[:detail_id])
		end
	end

private


	def authenticate_admin
   		unless current_user.admin
			redirect_to products_path
		end
	end

	def order_params
		params.require(:order).permit(:deliver_number)
	end

	def set_user
		@user = User.find params[:detail_id]
	end

	def find_order
		@order = Order.where('user_id=?',params[:detail_id]).find(params[:id])
	end

end