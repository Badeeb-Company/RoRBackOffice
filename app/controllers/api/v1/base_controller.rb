class Api::V1::BaseController < ActionController::Base
	layout 'base'

  # rescue_from Exception, with: :error_occurred

  private

  def get_page_params
  	page = params[:page].to_i > 0 ? params[:page] : 1
  	per_page = params[:page_size].to_i > 0 ? params[:page_size] : WillPaginate.per_page
  	{page: page, page_size: per_page}
  end

  # def error_occurred(exception)
  #   @message = exception.message
  #   Rails.logger.error("API ERROR: error => #{@message}, stack trace => #{exception.backtrace}")
  #   render 'api/v1/shared/empty', status: :internal_server_error
  # end  

end
