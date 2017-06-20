class PromotionPhoto < ApplicationRecord
  validates :photo, presence: true
  belongs_to :promotion

  mount_uploader :photo, PhotoUploader

end
