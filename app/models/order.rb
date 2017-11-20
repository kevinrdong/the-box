class Order < ApplicationRecord
	belongs_to :user
	has_many :ordered_items
	has_many :products, through: :ordered_items 

		validates_presence_of :address ,on: :update
	def total
		total = 60

		self.ordered_items.each do |ordered_item|

			total+= ordered_item.product.price * ordered_item.quantities
			
		end

	    return total   	
    end
end
