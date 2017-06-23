class Promotion < ApplicationRecord

	validates :title, :description, :due_date, presence: true

	validate :check_number_of_photos
	
	has_many :vendors, dependent: :destroy
	has_many :photos, class_name: 'PromotionPhoto', dependent: :destroy

	accepts_nested_attributes_for :photos, allow_destroy: true

	def main_photo
		photos.first.try(:photo_identifier)
	end

	def formatted_due_date
		if due_date
			due_date.strftime('%Y-%m-%d %H:%m')
		else
			due_date
		end
	end

	def persisted_photos
		photos.select do |photo|
			!photo.marked_for_destruction?
		end
	end

	private

	def check_number_of_photos
		if persisted_photos.size == 0
			errors.add(:base, 'Add at least one photo for each promotion')
		end
	end

end
