json.promotions @promotions do |promotion|
	json.id promotion.id
	json.title promotion.title
	json.due_date promotion.formatted_due_date
	json.main_photo "https://safe-bastion-53717.herokuapp.com#{promotion.main_photo}"
end