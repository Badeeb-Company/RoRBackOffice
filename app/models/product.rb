class Product < ApplicationRecord
	has_many :reviews
	
	validates :photo, presence: true

	mount_uploader :photo, PhotoUploader
end
