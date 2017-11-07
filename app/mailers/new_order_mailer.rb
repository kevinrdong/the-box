class NewOrderMailer < ApplicationMailer

	def new_order(user,order)
		@user = user
		@order = order
		mail(to:@user.email ,subject:"《一盒》訂單成立")		
	end

	def cancel_order(user,order)
		@user = user
		@order = order
		mail(to:@user.email ,subject:"《一盒》訂單取消")	
	end

end
