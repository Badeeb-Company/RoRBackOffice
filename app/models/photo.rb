class Photo < ApplicationRecord
  belongs_to :promotion

  mount_uploader :url, PhotoUploader

end
