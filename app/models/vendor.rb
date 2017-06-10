class Vendor < ApplicationRecord
	belongs_to :promotion

	validates :name, :vendor_type, :phone_number, :mobile_number, :governorate, :address, presence: true
	validates :lat, inclusion: {in: -90..90, message: "must be between -90 to 90"}
	validates :lng, inclusion: {in: -180..180, message: "must be between -180 to 180"}

end
