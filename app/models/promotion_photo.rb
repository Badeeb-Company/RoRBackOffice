class PromotionPhoto < ApplicationRecord
  validates :photo, presence: true
  belongs_to :promotion, inverse_of: :photos

  mount_uploader :photo, PhotoUploader

end
