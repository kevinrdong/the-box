class Product < ApplicationRecord

	mount_uploader :pictures, PictureUploader

	belongs_to :type 

	validates_presence_of :name,:price,:description,:pictures,:type_id
end
