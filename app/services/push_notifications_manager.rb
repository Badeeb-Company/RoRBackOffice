class PushNotificationsManager

	def self.android_fcm
		@@android_fcm ||= FCM.new(Rails.application.secrets.firebase_android_pn_key)
	end

	def self.send(notification)
		response = android_fcm.send_to_topic(PN_TOPIC_KEKY,
			notification: {
				title: notification.title,
				body: notification.description
				})
	end
end