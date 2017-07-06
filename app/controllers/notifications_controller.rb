class NotificationsController  < ApplicationController

	def new
		@notification = Notification.new
	end

	def create
		@notification = Notification.new(notification_params)
		if @notification.save
			PushNotificationsManager.send(@notification)
			redirect_to new_notification_path, notice: 'Notification sent successfully.'
		else
			render :new
		end
	end


	private

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
    	params.require(:notification).permit(:title, :description)
    end
end