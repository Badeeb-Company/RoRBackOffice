class Api::V1::ProductsController < Api::V1::BaseController

	def index
		page_params = get_page_params
		@products = Product.paginate(page: page_params[:page], per_page: page_params[:per_page])
			.order("id ASC")
	end

end