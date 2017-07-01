class Promotion < ApplicationRecord

	validates :title, :description, :due_date, presence: true

	validate :check_number_of_photos
	
	has_many :vendors, dependent: :destroy
	has_many :photos, class_name: 'PromotionPhoto', dependent: :destroy

	before_save :generate_dynamic_link

	accepts_nested_attributes_for :photos, allow_destroy: true

	def main_photo
		photos.first.try(:photo_url)
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
		if valid_photos.size == 0
			errors.add(:base, 'Add at least one photo for each promotion')
		end
	end

	def valid_photos
		photos.select do |photo|
			!photo.marked_for_destruction?
		end
	end

	def generate_dynamic_link
		if dynamic_link.blank?
			long_link = DYNAMIC_LINK_DOMAIN
			long_link << "?link=#{DYNAMIC_LINK_WEBSITE}"
			long_link << "?promotion_id=#{id}"
			long_link << "&apn=#{ANDROID_PACKAGE_NAME}"
			puts long_link
			body = {
				longDynamicLink: long_link,
				suffix: {option: 'SHORT'}
			}.to_json
			url = "#{DYNAMIC_LINK_SHORTEN_URL}?key=#{Rails.application.secrets.firebase_web_api_key}"
			response = HTTParty.post(url, body: body, :headers => {'Content-Type' => 'application/json'})
			if(response.code == 200)
				self.dynamic_link = JSON.parse(response.body)['shortLink']
			end
		end
	end

end
