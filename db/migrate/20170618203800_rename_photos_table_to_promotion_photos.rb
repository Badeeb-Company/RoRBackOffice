class RenamePhotosTableToPromotionPhotos < ActiveRecord::Migration[5.0]
  def change
  	rename_table :photos, :promotion_photos
  end
end
