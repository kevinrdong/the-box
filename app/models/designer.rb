class Designer < ApplicationRecord

	mount_uploader :image, DesignerUploader

	has_many :types

	validates_presence_of :name,:description,:image
end
