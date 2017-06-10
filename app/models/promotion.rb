class Promotion < ApplicationRecord
	has_many :vendors, dependent: :destroy
	has_many :photos, dependent: :destroy

	def main_photo
		photos.first.try(:url)
	end
end
