#insert products
for i in 1..45
	photo_name = i < 10 ? "0#{i}" : "#{i}"
	Product.create(url: "https://safe-bastion-53717.herokuapp.com/products/#{photo_name}.jpg")
end

#insert active promotions
for i in 1..5
	p = Promotion.create(
		title: "Title #{i}",
		description: "Description #{i}",
		due_date: Time.now + i.weeks
		)
	for j in 1..3
		photo_name = (i + j) < 10 ? "0#{i+j}" : "#{i+j}"
		p.photos.create(url: "https://safe-bastion-53717.herokuapp.com/products/#{photo_name}.jpg")
	end

	lats = [31.23931, 31.23498, 31.19242, 31.22826, 31.22072, 31.08749, 31.25504, 31.21374, 31.23455, 31.31820]
	lngs = [29.98623, 29.96502, 29.91641, 29.96137, 29.97754, 29.73034, 29.99710, 29.92513, 29.96702, 30.06055]
	for j in 1..10
		p.vendors.create(
			name: "vendor name #{i}#{j}",
			vendor_type: "vendor type #{i}#{j}",
			phone_number: "#{i}#{j}5822997",
			mobile_number: "#{i}#{j}1285875919",
			governorate: "governorate #{i}#{j}",
			address: "address #{i}#{j}",
			lat: lats[j],
			lng: lngs[j]
			)
	end
end