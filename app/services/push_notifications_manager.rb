class PushNotificationsManager

	def self.android_fcm
		@@android_fcm ||= FCM.new('AAAAtyObqkg:APA91bHoZKeFAMdsbYKbr-jUOg3TU2pMH_XsV-6btsFHhqCxmikG85MDBvHhwggJpVDM-wARRdhbWMdB7ljYUc-ZwB1nBppEpdsz2EOEaJ5ZTd3v52_2veKYaZrL2-YQ2eyhFVw84Mhc')
	end

	def self.send
		response = android_fcm.send_to_topic("waritex",
            notification: {body: "hello", title: 'Hello baby'})
			puts "Hello #{response.inspect}"
	end
end