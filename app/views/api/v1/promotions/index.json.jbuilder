json.promotions @promotions do |promotion|
	json.id promotion.id
	json.title promotion.title
	json.due_date promotion.formatted_due_date
	json.main_photo promotion.main_photo
end