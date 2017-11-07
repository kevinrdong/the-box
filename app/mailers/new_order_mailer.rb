class NewOrderMailer < ApplicationMailer

	def new_order(user)
		@user = user
		mail(to:@user.mail ,subject:"new order")
		
	end

end
