Config = {}

Config.Locale = 'th'
Config.RequiredCops = 2

Config.Delays = {
	MethProcessing = 500 * 10
}

Config.DrugDealerItems = {
	meth = 500
}

Config.LicenseEnable = false -- enable processing licenses? The player will be required to buy a license in order to process drugs. Requires esx_license

Config.LicensePrices = {
	meth_processing = {label = _U('license_meth'), price = 30000}
}

Config.GiveBlack = true -- give black money? if disabled it'll give regular cash.

Config.CircleZones = {
	MethField = {coords = vector3(3343.4, 5491.4, 19.88), color = 83, sprite = 514, radius = 1.0},
	MethProcessing = {coords = vector3(1665.9, 0.48, 166.12), color = 83, sprite = 514, radius = 1.0},
	-- MethField = {coords = vector3(3343.4, 5491.4, 19.88),},
	-- MethProcessing = {coords = vector3(1665.9, 0.48, 166.12),},

	--DrugDealer = {coords = vector3(-999999.02, -99999.98, 9999.66), color = 6, sprite = 378, radius = 25.0},
}