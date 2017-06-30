json.promotion_info do
	json.extract! @promotion, :id, :title, :description
	json.due_date @promotion.formatted_due_date
	json.photos @promotion.photos do |photo|
		json.id photo.id
		json.url "https://safe-bastion-53717.herokuapp.com#{photo.photo_url}"
	end
end