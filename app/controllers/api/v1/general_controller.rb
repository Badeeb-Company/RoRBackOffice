class Api::V1::GeneralController < Api::V1::BaseController

	def company_info
		page_params = get_page_params
		@company_info_values = Setting.where('key LIKE ?', '%COMPANY%')
		my_hash = {}
		@company_info_values.each do |info|
			my_hash[info.key] = info
		end
	end

end