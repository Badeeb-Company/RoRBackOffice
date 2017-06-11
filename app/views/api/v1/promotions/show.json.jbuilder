json.promotion_info do
	json.extract! @promotion, :id, :title, :description
	json.due_date @promotion.due_date.strftime('%Y-%m-%d %H:%m')
	json.photos @promotion.photos, :id, :url
end