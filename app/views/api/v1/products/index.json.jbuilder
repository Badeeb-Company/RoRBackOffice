json.products @products do |product|
	json.id product.id
	json.url product.photo
	json.name product.name
	json.description product.description
end