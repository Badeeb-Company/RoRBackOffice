class Promotion < ApplicationRecord

	validates :title, :description, :due_date, presence: true

	validate do
		check_number_of_photos
	end
	
	has_many :vendors, dependent: :destroy
	has_many :promotion_photos, dependent: :destroy

	accepts_nested_attributes_for :promotion_photos, allow_destroy: true

	def main_photo
		promotion_photos.first.try(:photo).try(:url)
	end

	def formatted_due_date
		if due_date
			due_date.strftime('%Y-%m-%d %H:%m')
		else
			due_date
		end
	end

	private

	def check_number_of_photos
		unless promotion_photos.size > 0
			errors.add(:base, 'Add at least one photo for each promotion')
		end
	end

end
