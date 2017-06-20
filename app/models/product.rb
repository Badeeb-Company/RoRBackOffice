class Product < ApplicationRecord
	validates :photo, presence: true
	
	mount_uploader :photo, PhotoUploader
end
