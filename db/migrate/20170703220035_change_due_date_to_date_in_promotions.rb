class ChangeDueDateToDateInPromotions < ActiveRecord::Migration[5.0]
  def change
  	change_column :promotions, :due_date, :date
  end
end
