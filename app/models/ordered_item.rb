class OrderedItem < ApplicationRecord
	belongs_to :order 
	belongs_to :product

	def total
		total = 0

			total+= self.product.price * self.quantities

	    return total   
	end
end
