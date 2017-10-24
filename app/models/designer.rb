class Designer < ApplicationRecord

	mount_uploader :image, DesignerUploader

	validates_presence_of :name,:description,:image
end
