Config              = {}
Config.DrawDistance = 100
Config.Size         = {x = 1.5, y = 1.5, z = 1.5}
Config.Color        = {r = 0, g = 100, b = 255}
Config.Type         = 27
Config.Locale       = 'en'

Config.Map = {
  --{name="Tequil-La La Club",color=27, id=93, x=-565.906, y=276.093, z=100.176},
  --{name="Bahamas Club",color=27, id=93,x =-1388.409, y =-585.624, z =100.319},
  --{name="Strip Club",color=27, id=121,x =132.17, y =-1304.42, z =100.319},
  --{name="Yellow Jack Club",color=27, id=93,x =1992.69, y =3058.57, z =100.319},
  --{name="Galaxy Club",color=27, id=93,x =5.00, y =220.24, z =107.72}, -- Wainting for the nightclub id blip
  {name="24-7 Shop",color=2, id=52,x =373.875, y =325.896, z =100.319},
  {name="24-7 Shop",color=2, id=52,x =2557.458, y =382.282, z =100.319},
  {name="24-7 Shop",color=2, id=52,x =-3038.939, y =585.954, z =6.908},
  {name="24-7 Shop",color=2, id=52,x =-3241.927, y =1001.462, z =11.830},
  {name="24-7 Shop",color=2, id=52,x =547.431, y =2671.710, z =41.156},
  {name="24-7 Shop",color=2, id=52,x =1961.464, y =3740.672, z =31.343},
  {name="24-7 Shop",color=2, id=52,x =2678.916, y =3280.671, z =54.241},
  {name="24-7 Shop",color=2, id=52,x =1729.216, y =6414.131, z =34.037},
  {name="24-7 Shop",color=2, id=52,x =1135.808, y =-982.281, z =45.415},
  {name="24-7 Shop",color=2, id=52,x =-1222.915, y =-906.983, z =11.326},
  {name="24-7 Shop",color=2, id=52,x =-1487.553, y =-379.107, z =39.163},
  {name="24-7 Shop",color=2, id=52,x =-2968.243, y =390.910, z =14.043},
  {name="24-7 Shop",color=2, id=52,x =1166.024, y =2708.930, z =37.157},
  {name="24-7 Shop",color=2, id=52,x =1392.562, y =3604.648, z =33.980},
  {name="24-7 Shop",color=2, id=52,x =-48.519, y =-1757.514, z =28.421},
  {name="24-7 Shop",color=2, id=52,x =1163.373, y =-323.801, z =68.205},
  {name="24-7 Shop",color=2, id=52,x =-707.501, y =-914.260, z =18.215},
  {name="24-7 Shop",color=2, id=52,x =-1820.523, y =792.518, z =137.118},
  --{name="Fishing Shop",color=2, id=52,x = -3275.6, y =964.5, z =7.4},
  {name="24-7 Shop",color=2, id=52,x =1698.388, y =4924.404, z =41.063}
}

Config.Zones = {

	TwentyFourSeven = {
        Items = {bread, chocolate, sandwich, hamburge, cupcake, water, cocacola, icetea, coffe, milk, cigarett, lighter, phone, jumelles},
        Pos = {
            {x = 373.875,   y = 325.896,  z = 102.566},
            {x = 2557.458,  y = 382.282,  z = 107.622},
            {x = -3038.939, y = 585.954,  z = 6.908},
            {x = -3241.927, y = 1001.462, z = 11.830},
            {x = 547.431,   y = 2671.710, z = 41.156},
            {x = 1961.464,  y = 3740.672, z = 31.343},
            {x = 2678.916,  y = 3280.671, z = 54.241},
            {x = 1729.216,  y = 6414.131, z = 34.037}
        }
    },

    RobsLiquor = {
        Items = {bread, chocolate, sandwich, hamburge, cupcake, water, cocacola, icetea, coffe, milk, cigarett, lighter, phone, jumelles},
        Pos = {
            {x = 1135.808,  y = -982.281,  z = 45.415},
            {x = -1222.915, y = -906.983,  z = 11.326},
            {x = -1487.553, y = -379.107,  z = 39.163},
            {x = -2968.243, y = 390.910,   z = 14.043},
            {x = 1166.024,  y = 2708.930,  z = 37.157},
            {x = 1392.562,  y = 3604.684,  z = 33.980}
        }
    },

    LTDgasoline = {
        Items = {bread, chocolate, sandwich, hamburge, cupcake, water, cocacola, icetea, coffe, milk, cigarett, lighter, phone, jumelles},
        Pos = {
            {x = -48.519,   y = -1757.514, z = 28.421},
            {x = 1163.373,  y = -323.801,  z = 68.205},
            {x = -707.501,  y = -914.260,  z = 18.215},
            {x = -1820.523, y = 792.518,   z = 137.118},
            {x = 1698.388,  y = 4924.404,  z = 41.063}
        }
    },

    Bar = {
        Items = {beer, wine, vodka, tequila, whisky, cigarett, lighter},
        Pos = {
            {x = 127.830,   y = -1284.796, z = 28.280}, --StripClub
            {x = -1393.409, y = -606.624,  z = 29.319}, --Bahamamas
            {x = -559.906,  y = 287.093,   z = 81.176}, --Tequila la
            {x = 1986.18,   y = 3054.31,   z = 46.32}
        }
    },
	
    Disco = {
        Items = {beer, wine, vodka, tequila, whisky, cigarett, lighter},
        Pos = {
            {x = -1586.922,   y = -3012.860, z = -77.004}, --Upstairs
			{x = -1578.204,   y = -3014.460, z = -80.005}  --Downstairs
        }
    },
	
	fishing_shop = {
        Items = {fishingrod, turtlebait, fishbait},
        Pos = {
            {x = -3275.6, y = 964.5, z = 7.4} --Upstairs
        }
    },
	
	pillbox = {
        Items = {medikit, oxygen_mask, bread, water},
        Pos = {
            {x = 316.78, y = -588.41, z = 42.3} --Upstairs
        }
    },
	
	policebox = {
        Items = {clip, fixkit, radio},
        Pos = {
            --{x = 459.9, y = -990.66, z = 30.0} --Upstairs
        }
    },
	
	weaponeacc = {
        Items = {weaponflashlight, clip, weapongrip, weaponskin},
        Pos = {
            {x = 19.5,   y = -1106.34, z = 28.0},
			{x = -664.61, y = -934.93, z = 20.83},
			{x = 812.79, y = -2157.68, z = 28.62},
			{x = 844.8, y = -1033.57, z = 27.19},
			{x = 253.39, y = -47.57, z = 68.94},
			{x = 1691.99, y = 3758.05, z = 33.71}
        }
    },
	
	WeedZone = {
		Items = {},
		Pos = {
			{x = -1172.86,   y = -1572.23, z = 3.66}
		},
		CustomBlip = {
			Text = "Weed Shop",
			Blip = 140,
			Color = 2,
			Size = 0.8
		},
		ShowBlip = true,
		Marker = true
	},
	
	HandCuffs = {
		Items = {},
		Pos = {
			{x = 758.55,   y = -3197.81, z = 5.07}
		}
	},
	
	reporterShop = {
		Items = {},
		Pos = {
			{x = -1082.12,   y = -248.0, z = 36.76}
		},
		CustomBlip = {
			Text = "reporter Shop",
			Blip = 590,
			Color = 24,
			Size = 0.8
		},
		Marker = true,
		ShowBlip = true,
		Job = "reporter"
	},
	--[[
	loffeShop = {
		Items = {},
		Pos = {
			{x = 25.86,   y = -1347.67, z = 28.515}
		},
		CustomBlip = {
			Text = "24-7 Shop",
			Blip = 52,
			Color = 2,
			Size = 1.0
		},
		Marker = true,
		ShowBlip = true
	}
	]]--
	
	ScubaDive = {
		Items = {},
		Pos = {
			{x = 452.92,   y = -973.15, z = 30.69}
		},
		Marker = true,
		ShowBlip = false,
		Job = "police"
	}
}
