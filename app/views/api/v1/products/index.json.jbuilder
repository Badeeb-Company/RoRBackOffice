json.products @products do |product|
	json.id product.id
	json.url "https://safe-bastion-53717.herokuapp.com#{product.photo_url}"
end