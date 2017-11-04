class Admin::OrderController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin


	def destroy
		order = Order.where('user_id=?',params[:detail_id]).find(params[:id])
		order.cancel = true
		if order.save
			redirect_to admin_detail_path(params[:detail_id])
		end
	end

private


	def authenticate_admin
   		unless current_user.admin
			redirect_to products_path
		end
	end

end