class Promotion < ApplicationRecord
	has_many :vendors
	has_many :photos

	def main_photo
		photos.first.try(:url)
	end
end
