class ChangeUrlColumnsNames < ActiveRecord::Migration[5.0]
  def change
  	rename_column :products, :url, :photo
  	rename_column :promotion_photos, :url, :photo
  end
end
