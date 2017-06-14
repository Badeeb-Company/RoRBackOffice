class Promotion < ApplicationRecord
	
	has_many :vendors, dependent: :destroy
	has_many :photos, dependent: :destroy

	accepts_nested_attributes_for :photos, allow_destroy: true

	def main_photo
		photos.first.try(:url)
	end

	def formatted_due_date
		if due_date
			due_date.strftime('%Y-%m-%d %H:%m')
		else
			due_date
		end
	end
end
