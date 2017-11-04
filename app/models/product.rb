class Product < ApplicationRecord

	mount_uploader :pictures, PictureUploader
	
	belongs_to :type 
	has_many :ordered_items,dependent: :destroy
	has_many :orders, through: :ordered_items 

	validates_presence_of :name,:price,:description,:pictures,:type_id
end
