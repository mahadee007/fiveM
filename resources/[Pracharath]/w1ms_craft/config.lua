Config = {}
Config.WeaponAmmo = 50
Config.CraftingPrice = 500


Config.Recipes = {

	['WEAPON_PISTOL'] = {  
		{item = "iron", quantity = 40 }, 
		{item = "Spring", quantity = 5 },
		{item = "magazine", quantity = 1 },
		{item = "weapongrip", quantity = 1 },
		{item = "nots", quantity = 5 },
		{item = "copper", quantity = 20 },
	},

	['WEAPON_KNIFE'] = { 
		{item = "iron", quantity = 15 },
        {item = "pro_wood", quantity = 10 },
		{item = "nots", quantity = 5 },		
	},

	['magazine'] = { 
		{item = "iron", quantity = 20 },
		{item = "Spring", quantity = 5 },
		{item = "nots", quantity = 5 },		
    },
	
	['clip'] = { 
		{item = "copper", quantity = 20 },
		{item = "gunpowder", quantity = 10 }, 		
	},
	
	['c4_bank'] = { 
		{item = "gunpowder", quantity = 15 },
		{item = "wire", quantity = 5 },
		{item = "nots", quantity = 5 },
	},
	
	['wire'] = { 
		{item = "copper", quantity = 10 }, 
	},
	
	['WEAPON_BAT'] = { 
		{item = "iron", quantity = 60 }, 
	},
	
	['weapongrip'] = { 
		{item = "iron", quantity = 10 },
		{item = "nots", quantity = 5 },
	},
	
    ['gunpowder'] = { 
		{item = "b_clar", quantity = 1 },
		{item = "saltpeter", quantity = 1 },
	},
	
	['nots'] = { 
	    {item = "iron", quantity = 2 },
	},
	
    ['saltpeter'] = { 
        {item = "stone", quantity = 5 },
	},
	
    ['Spring'] = { 
        {item = "iron", quantity = 10 },
	},
	
    ['WEAPON_POOLCUE'] = { 
        {item = "wood", quantity = 10 },
	},

    ['WEAPON_revolver'] = { 
		{item = "iron", quantity = 95 }, 
		{item = "Spring", quantity = 15 },
		{item = "magazine", quantity = 1 },
		{item = "weapongrip", quantity = 1 },
		{item = "nots", quantity = 5 },
		{item = "copper", quantity = 15 },
	},
	
    ['WEAPON_Hatchet'] = { 
		{item = "iron", quantity = 70 }, 
		{item = "a_clar", quantity = 50 },
	},
	
    ['WEAPON_VINTAGEPISTOL'] = { 
		{item = "iron", quantity = 98 }, 
		{item = "Spring", quantity = 10 },
		{item = "magazine", quantity = 1 },
		{item = "weapongrip", quantity = 1 },
		{item = "nots", quantity = 10 },
		{item = "copper", quantity = 14 },
	},
}


Config.Percen = {
	WEAPON_PISTOL 	= {per = 30},
	WEAPON_KNIFE   = {per = 60},
	WEAPON_POOLCUE = {per = 60},
	WEAPON_VINTAGEPISTOL = {per = 30},
	WEAPON_BAT 	= {per = 80},
	magazine = {per = 100},
	clip = {per = 80},
	c4_bank = {per = 80},
	wire = {per = 100},
	weapongrip = {per = 100},
	gunpowder = {per = 100},
	saltpeter = {per = 100},
	nots = {per = 100},
	WEAPON_revolver = {per = 30},
	WEAPON_HATCHET = {per = 60},
	Spring = {per = 100},
}







-- Enable a shop to access the crafting menu
Config.Shop = {
	useShop = true,
	shopCoordinates = { x=149.8, y=322.06, z=111.19 },
	shopName = "Crafting",
	shopBlipID = 402,
	zoneSize = { x = 1.5, y = 1.5, z = 1.5 },
	zoneColor = { r = 255, g = 0, b = 0, a = 150 }
}

-- Enable crafting menu through a keyboard shortcut
Config.Keyboard = {
	useKeyboard = false,
	keyCode = 303
}
