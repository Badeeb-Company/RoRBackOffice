class Api::V1::GeneralController < Api::V1::BaseController

	def company_info
		page_params = get_page_params
		company_info_values = Setting.where('key LIKE ?', '%COMPANY_%')
		values_hash = {}
		company_info_values.each do |info|
			values_hash[info.key] = info
		end
		@about = values_hash[Setting::COMPANY_ABOUT].value
		@telephone = values_hash[Setting::COMPANY_TELEPHONE].value
		@fax = values_hash[Setting::COMPANY_FAX].value
		@website = values_hash[Setting::COMPANY_WEBSITE].value
		@facebook_page = values_hash[Setting::COMPANY_FACEBOOK].value
		@whatsapp_number = values_hash[Setting::COMPANY_WHATSAPP].value
	end

end