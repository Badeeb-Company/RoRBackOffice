json.products @products do |product|
	json.id product.id
	json.url product.photo_url
end