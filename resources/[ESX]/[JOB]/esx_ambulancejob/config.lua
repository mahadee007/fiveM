Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }

Config.ReviveReward               = 1000  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = true -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'en'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 1 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 45 * minute -- Time til the player bleeds out
Config.BleedoutTimer2              = 2 * minute -- Time til the player bleeds out


Config.EnablePlayerManagement     = true
Config.EnableHeal20percent 		  = false --Setheal 20%
Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = true
Config.EarlyRespawnFineAmount     = 5000


Config.RespawnPoint = { coords = vector3(362.34436035156,-591.46838378906,43.315006256104), heading = 48.5 }



Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(305.01, -598.07, 42.29),
			sprite = 61,
			scale  = 1.2,
			color  = 2
		},

		AmbulanceActions = {
			vector3(310.63, -598.92, 42.29)
		},

		Pharmacies = {
			vector3(323.38,-581.91,43.32)    
		},

		Vehicles = {
			{
				Spawner = vector3(294.70,-601.61,43.30),
				InsideShop = vector3(446.7, -1355.6, 44.5),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(277.54, -581.36, 42.9), heading = 338.77, radius = 8.0 },
					{ coords = vector3(273.85, -591.22, 42.9), heading = 338.77, radius = 8.0 },
					{ coords = vector3(279.44, -588.86, 43.0), heading = 336.25, radius = 8.0 }
					
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(341.37,-580.89,74.16),
				InsideShop = vector3(305.6, -1419.7, 41.5),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(352.52, -587.78, 73.89), heading = 305.0, radius = 10.0 },
				}
			}
		},

		FastTravels = {
			{
				From = vector3(325.42,-598.78,42.35),
				To = { coords = vector3(337.89,-586.39,75.2), heading = 0.0 },
				Marker = { type = 27, x = 1.5, y = 1.5, z = 2, r = 0, g = 0, b = 255, a = 100, rotate = false }
			},

			{
				From = vector3(339.97,-584.07,73.20),
				To = { coords = vector3(322.83,-598.02,44.4), heading = 0.0 },
				Marker = { type = 27, x = 1.5, y = 1.5, z = 2, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

--[[			{
				From = vector3(247.3, -1371.5, 23.5),
				To = { coords = vector3(333.1, -1434.9, 45.5), heading = 138.6 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 2, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(335.5, -1432.0, 45.50),
				To = { coords = vector3(249.1, -1369.6, 23.5), heading = 0.0 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 2, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(234.5, -1373.7, 20.9),
				To = { coords = vector3(320.9, -1478.6, 28.8), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(317.9, -1476.1, 28.9),
				To = { coords = vector3(238.6, -1368.4, 23.5), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false }
			}--]]
		},

		FastTravelsPrompt = {
			{
				From = vector3(237.4, -1373.8, 26.0),
				To = { coords = vector3(251.9, -1363.3, 38.5), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(256.5, -1357.7, 36.0),
				To = { coords = vector3(235.4, -1372.8, 26.3), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			}
		}

	}
}

Config.AuthorizedVehicles = {

	ambulance = {
		{ model = 'police2', label = 'รถหมอ', price = 20000}
	},

	doctor = {
		{ model = 'police2', label = 'รถหมอ', price = 20000}
	},

	chief_doctor = {
		{ model = 'police2', label = 'รถหมอ', price = 20000}
	},

	boss = {
		{ model = 'police2', label = 'รถหมอ', price = 20000}
	}

}

Config.AuthorizedHelicopters = {

	ambulance = {{ model = 'frogger', label = 'Ambulance Helicopters', price = 150000 }},

	boss = {
		{ model = 'frogger', label = 'Ambulance Helicopters', price = 150000 }
	}


}
