class ChangeVendorTypeColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :vendors, :type, :vendor_type
  end
end
