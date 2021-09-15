Config = {}
Config.Locale = 'en'
Config.NumberOfCopsRequired = 7

Banks = {
	["fleeca"] = {
		position = { ['x'] = 147.04908752441, ['y'] = -1044.9448242188, ['z'] = 29.36802482605 },
		reward = math.random(250000,350000),
		nameofbank = "Fleeca Bank", -- ธนาคารกลาง
		lastrobbed = 0
	},
	["fleeca2"] = {
		position = { ['x'] = -2957.6674804688, ['y'] = 481.45776367188, ['z'] = 15.697026252747 },
		reward = math.random(250000,350000),
		nameofbank = "Fleeca Bank", --ไฮเวย์
		lastrobbed = 0
	},
	["blainecounty"] = {
		position = { ['x'] = -107.06505584717, ['y'] = 6474.8012695313, ['z'] = 31.62670135498 },
		reward = math.random(250000,350000),
		nameofbank = "Blaine County", -- หมู่บ้าน
		lastrobbed = 0
	},
	["PrincipalBank"] = {
		position = { ['x'] = 254.19, ['y'] = 225.77, ['z'] = 101.88 },
		reward = math.random(350000,4500000),
		nameofbank = "Principal bank", -- ธนาคารใหญ่
		lastrobbed = 0
	}
}