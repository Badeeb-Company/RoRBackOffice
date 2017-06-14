json.promotion_info do
	json.extract! @promotion, :id, :title, :description
	json.due_date @promotion.formatted_due_date
	json.photos @promotion.photos, :id, :url
end