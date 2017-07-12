class Api::V1::PromotionsController < Api::V1::BaseController

	def index
		page_params = get_page_params
		expired = false
		if params[:expired] == 'true'
			expired = true
		end
		if expired
			@promotions = Promotion.expired.paginate(page: page_params[:page], per_page: page_params[:page_size]).order("due_date DESC")
		else
			@promotions = Promotion.valid.paginate(page: page_params[:page], per_page: page_params[:page_size]).order("due_date DESC")
		end
	end

	def show
		@promotion = Promotion.find_by_id(params[:id])
		if !@promotion.present?
			@message = 'Promotion not found'
			render 'api/v1/empty', status: :unprocessable_entity
		end
	end

	def vendors
		lat = params[:lat]
		lng = params[:lng]
		page_params = get_page_params
		if !valid_location?(lat, lng)
			@message = 'Invalid location'
			render 'api/v1/empty', status: :unprocessable_entity
		else
			promotion = Promotion.find_by_id(params[:promotion_id])
			if !promotion.present?
				@message = 'Promotion not found'
				render 'api/v1/empty', status: :unprocessable_entity
			else
				page = page_params[:page]
				per_page = page_params[:page_size]
				@vendors = Vendor.find_near_vendors(promotion.vendors, lat, lng, page, per_page)
			end
		end

	end

	private

	def valid_location?(lat, lng)
		lat && lng && (-90..90).include?(lat.to_f) && (-180..180).include?(lng.to_f)
	end

end