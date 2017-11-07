class NewOrderMailer < ApplicationMailer

	def new_order(user,order)
		@user = user
		@order = order
		mail(to:@user.email ,subject:"《一盒》訂單成立")
		
	end

end
