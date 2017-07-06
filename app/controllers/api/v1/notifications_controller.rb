class Api::V1::NotificationsController < Api::V1::BaseController

	def index
		page_params = get_page_params
		@notifications = Notification.paginate(page: page_params[:page], per_page: page_params[:page_size])
			.order("created_at DESC")
	end

end