class Vendor < ApplicationRecord
	belongs_to :promotion

	validates :name, :vendor_type, :phone_number, :mobile_number, :governorate, :address, presence: true
	validates :lat, inclusion: {in: -90..90, message: "must be between -90 to 90"}
	validates :lng, inclusion: {in: -180..180, message: "must be between -180 to 180"}

	attr_accessor :distance

	class << self
		def excel_columns
			[:name, :vendor_type, :phone_number, :mobile_number, :governorate, :address, :lat, :lng]
		end

		def find_near_vendors(vendors, lat, lng, page, per_page)
			max_vendors_setting = Setting.find_by_key(Setting::MAX_VENDORS_NO)
			max_vendors_no = 0
			if max_vendors_setting.present?
				max_vendors_no = max_vendors_setting.value.to_i
			end
			if max_vendors_no < 1
				max_vendors_no = DEFAULT_MAX_VENDORS_NO
			end
			vendors.each do |v|
				distance = Geocoder::Calculations::distance_between([v.lat, v.lng], [lat, lng], units: :km)
				v.distance = distance
			end
			sorted_vendors = vendors.sort do
				|x, y| x.distance <=> y.distance
			end
			offset = (page.to_i - 1) * per_page.to_i
			if offset < max_vendors_no
				sorted_vendors.slice(offset, [per_page.to_i, max_vendors_no - offset].min)
			end
		end

	end

end
