json.promotion_info do
	json.extract! @promotion, :id, :title, :description
	json.due_date @promotion.formatted_due_date
	json.photos @promotion.promotion_photos do |photo|
		json.id photo.id
		json.url photo.url
	end
end