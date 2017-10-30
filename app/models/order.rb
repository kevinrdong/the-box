class Order < ApplicationRecord
	belongs_to :user
	has_many :ordered_items
	has_many :products, through: :ordered_items 


	def total
		total = 0

		self.ordered_items.each do |ordered_item|

			total+= ordered_item.product.price * ordered_item.quantities
			
		end

	    return total   	
    end
end
