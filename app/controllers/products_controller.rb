class ProductsController < ApplicationController
	before_action :authenticate_user!,only:[:order,:order_index,:item_destroy,:update]

	def index	
		@types = Type.includes(:products)
	end

	def show
		@product = Product.find params[:id]	
		
		@ordered_item = OrderedItem.new
		session['product_id']=params[:id]
	end

	def brand	
	end

	def designers	
		@designers = Designer.all	
	end

	def contact	
	end

	def order

		user = current_user

		if order = Order.where('user_id=?',user).find_by(pay:1)
			order = Order.where('user_id=?',user).find_by(pay:1)
		else
		    order = user.orders.create
		end		

		if OrderedItem.where('order_id=?',order.id).find_by(product_id:session['product_id'])
			ordered_item = OrderedItem.where('order_id=?',order.id).find_by(product_id:session['product_id'])
			ordered_item.increment!(:quantities,1)
		else
			ordered_item = order.ordered_items.create 
		    ordered_item.product_id = session['product_id']
		    ordered_item.save
		end


		redirect_to orders_path

	end

	def order_index

		user = current_user
		if @order = Order.where('user_id=?',user).find_by(pay:1)
			@order = Order.where('user_id=?',user).find_by(pay:1)
		else
		    @order = user.orders.create
		end		
		@ordered_items = OrderedItem.includes(:product).where('order_id=?',@order.id)
	

	end

	def item_destroy

		@ordered_item = OrderedItem.find params[:id]	

		if @ordered_item.destroy
			redirect_to orders_path
		end
	end

	def update

		@ordered_item = OrderedItem.find params[:id]	

		if @ordered_item.update item_params
		  redirect_to orders_path
		end
	end

	def option
		order = Order.where('user_id=?',current_user).find_by(pay:1)
		
		if order.nil?
			redirect_to products_path 
			flash[:note]="請重新選購商品！"
		else		
			if order.total !=0
				if order.update order_params
					order.pay = 0
					order.save
					flash[:note]="訂單已成立！"
					NewOrderMailer.new_order(current_user).deliver
					redirect_to detail_path
				else
					redirect_to orders_path
				end	
			else
				flash[:note]="請先購買商品！"
				redirect_to orders_path		
			end
		end
	end

	def detail
		@orders = Order.includes(:ordered_items,:products).where(['pay=? and user_id=?',0,current_user])
	end


private
	def item_params
	params.require(:ordered_item).permit(:quantities)
	end

	def order_params
	params.require(:order).permit(:option,:pay,:address)
	end
end
