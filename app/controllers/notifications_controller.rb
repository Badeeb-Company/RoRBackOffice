class NotificationsController  < ApplicationController

  before_action :set_notification, only: [:show, :destroy]

	# GET /notifications
	def index
		@notifications = Notification.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
	end

	# GET /notifications/1
 def show
 end

 def new
  @notification = Notification.new
end

  def create
    @notification = Notification.new(notification_params)
    if @notification.save
     PushNotificationsManager.send(@notification)
     redirect_to notifications_url, notice: 'Notification sent successfully.'
   else
     render :new
   end
  end

    # DELETE /notifications/1
    def destroy
      @notification.destroy
      redirect_to notifications_url, notice: 'Notification was successfully destroyed.'
    end


    private

    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
    	params.require(:notification).permit(:title, :description)
    end
  end