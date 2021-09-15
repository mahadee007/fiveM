Config = {}

Config.Locale = 'th'
Config.RequiredCops = 3

Config.Delays = {
	WeedProcessing = 1000 * 10
}

Config.DrugDealerItems = {
	marijuana = 500
}

Config.LicenseEnable = false -- enable processing licenses? The player will be required to buy a license in order to process drugs. Requires esx_license

Config.LicensePrices = {
	weed_processing = {label = _U('license_weed'), price = 15000}
}

Config.GiveBlack = true -- give black money? if disabled it'll give regular cash.

Config.CircleZones = {  
	WeedField = {coords = vector3(-1646.13, 4573.64, 42.64), color = 25, sprite = 496, radius = 1.0},
	WeedProcessing = {coords = vector3(486.15, -1529.7, 29.47), color = 25, sprite = 496, radius = 1.0},

	DrugDealer = {coords = vector3(-999999.02, -99999.98, 9999.66), color = 6, sprite = 378, radius = 25.0},
}