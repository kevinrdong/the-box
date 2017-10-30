class Product < ApplicationRecord

	mount_uploaders :pictures, PictureUploader

	belongs_to :type 
	has_many :ordered_items
	has_many :orders, through: :ordered_items 

	validates_presence_of :name,:price,:description,:pictures,:type_id
end
