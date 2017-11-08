class Product < ApplicationRecord

	mount_uploader :pictures, PictureUploader
	mount_uploader :image1,Image1Uploader
	mount_uploader :image2,Image2Uploader
	mount_uploader :image3,Image3Uploader
	mount_uploader :image4,Image4Uploader
	
	belongs_to :type 
	has_many :ordered_items,dependent: :destroy
	has_many :orders, through: :ordered_items 
	belongs_to :designer

	validates_presence_of :name,:price,:description,:pictures,:type_id,:designer_id
end
