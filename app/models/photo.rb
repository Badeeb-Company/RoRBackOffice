class Photo < ApplicationRecord
  validates :url, presence: true
  belongs_to :promotion

  mount_uploader :url, PhotoUploader

end
