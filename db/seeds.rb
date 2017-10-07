Setting.create(
	key: Setting::MAX_VENDORS_NO,
	value: '5',
	description: 'Maximum number of vendors shown to the mobile user'
	)

Setting.create(
	key: Setting::COMPANY_ABOUT,
	value: 'تم تأسيس شركه وريتكس الام بدوله سوريا في عام 1926 كشركه مصنعه للنسيج وتم اعاده هيكله الشركه بالكامل في عام 1982 وترخيصها بالولايات المتحده الامريكيه تحت اسم وريتكس فلوريدا',
	description: ''
	)

Setting.create(
	key: Setting::COMPANY_TELEPHONE,
	value: '0554 500055/94',
	description: ''
	)

Setting.create(
	key: Setting::COMPANY_FAX,
	value: '0554 500095',
	description: ''
	)

Setting.create(
	key: Setting::COMPANY_WEBSITE,
	value: 'www.waritex.com',
	description: ''
	)

Setting.create(
	key: Setting::COMPANY_FACEBOOK,
	value: 'https://www.facebook.com/waritexint/',
	description: ''
	)

Setting.create(
	key: Setting::COMPANY_WHATSAPP,
	value: '01285111211',
	description: ''
	)

User.create(
	username: 'admin',
	password: '123456'
	)