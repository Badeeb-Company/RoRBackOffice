class PromotionPhoto < ApplicationRecord
	
  belongs_to :promotion, inverse_of: :photos

  # mount_uploader :photo, PhotoUploader

end
