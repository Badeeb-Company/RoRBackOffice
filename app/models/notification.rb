class Notification < ApplicationRecord
	
	validates :title, :description, presence: true

end