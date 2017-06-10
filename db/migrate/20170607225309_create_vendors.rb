class CreateVendors < ActiveRecord::Migration[5.0]
  def change
    create_table :vendors do |t|
      t.references :promotion, foreign_key: true
      t.string :name
      t.string :type
      t.string :phone_number
      t.string :mobile_number
      t.string :governorate
      t.string :address
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
