class AddDynamicLinkToPromotions < ActiveRecord::Migration[5.0]
  def up
  	add_column :promotions, :dynamic_link, :string
  end

  def down
  	remove_column :promotions, :dynamic_link
  end
end
