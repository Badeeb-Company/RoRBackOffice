class Api::V1::ProductsController < Api::V1::BaseController

	def index
		page_params = get_page_params
		@products = Product.paginate(page: page_params[:page], per_page: page_params[:page_size])
			.order("id ASC")
	end

	def reviews_create
		product = Product.find_by_id(params[:id])
		if !product.present?
			render_unprocessable('Product not found') and return
		end
		message = params[:message]
		if message.blank?
			render_unprocessable('Cannot add empty review') and return
		end
		saved = product.reviews.create(message: params[:message])
		if !saved
			render_unprocessable('Cannot add user review') and return
		end
		render 'api/v1/empty'
	end

	def reviews_index
		product = Product.find_by_id(params[:id])
		if !product.present?
			render_unprocessable('Product not found') and return
		end
		page_params = get_page_params
		@reviews = product.reviews.paginate(page: page_params[:page], per_page: page_params[:page_size])
			.order("created_at DESC")
	end

end