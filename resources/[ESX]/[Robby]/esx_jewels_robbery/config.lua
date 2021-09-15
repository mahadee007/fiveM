Config = {}
Config.Locale = 'en' -- traduções disponives br-en

Config.RequiredCopsRob = 0 -- Quantidade de policias na cidade para roubar
-- Config.RequiredCopsSell = 0-- Quantidade de policias na cidade para vender

Config.DrugDealerItems = {
	necklace = 10000,
	ring = 15000,
	earring = 1000,
	jewels =  5000,
}

-- Config.LicenseEnable = false -- enable processing licenses? The player will be required to buy a license in order to process drugs. Requires esx_license

-- Config.LicensePrices = {
-- 	weed_processing = {label = _U('license_weed'), price = 15000}
-- }

Config.GiveBlack = false -- give black money? if disabled it'll give regular cash.

Config.CircleZones = {
	DrugDealer = {coords = vector3(1415.1743, 1164.1409, 114.3342), name = _U('blip_drugdealer'), color = 32, sprite = 197, radius = 25.0},
}
  
Stores = {
	["jewelry"] = {
		position = { ['x'] = -629.99, ['y'] = -236.542, ['z'] = 38.05 },
		reward = 10000,
		nameofstore = "jewelry",
		lastrobbed = 0
	}
}
