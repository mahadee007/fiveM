Config = {}

Config.Locale = 'th'
Config.RequiredCops = 2

Config.Delays = {
	CokeProcessing = 500 * 10
}

Config.DrugDealerItems = {
	coke = 500
}

Config.LicenseEnable = false -- enable processing licenses? The player will be required to buy a license in order to process drugs. Requires esx_license

Config.LicensePrices = {
	coke_processing = {label = _U('license_coke'), price = 30000}
}

Config.GiveBlack = true -- give black money? if disabled it'll give regular cash.

Config.CircleZones = {
	CokeField = {coords = vector3(-879.809, 6023.625, 38.546), color = 49, sprite = 501, radius = 1.0},
	CokeProcessing = {coords = vector3(3310.872, 5176.382, 19.614), color = 49, sprite = 501, radius = 1.0},
	-- CokeField = {coords = vector3(-879.809, 6023.625, 38.546),},
	-- CokeProcessing = {coords = vector3(3310.872, 5176.382, 19.614),},

	--DrugDealer = {coords = vector3(-999999.02, -99999.98, 9999.66), color = 6, sprite = 378, radius = 25.0},
}