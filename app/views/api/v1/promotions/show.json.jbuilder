json.promotion_info do
	json.extract! @promotion, :id, :title, :description, :due_date
	json.photos @promotion.photos, :id, :url
end