class NewOrderMailer < ApplicationMailer

	def new_order(user)
		@user = user
		mail(to:@user.email ,subject:"new order")
		
	end

end
