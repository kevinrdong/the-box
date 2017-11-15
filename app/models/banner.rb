class Banner < ApplicationRecord
	mount_uploader :banner1,Banner1Uploader
	mount_uploader :banner2,Banner2Uploader
	mount_uploader :banner3,Banner3Uploader
end
