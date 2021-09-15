Config.PublicZones = {


	Zones = {

		cocaine = {
			Pos = {x = 720.74, y = 1291.41, z = 360.3},
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 0, g = 0, b = 0},
			Marker = 1,
			Blip = false,
			Name = _U("dd_cocaine"),
			Item = {
				{
					name = _U("dd_cocaine"),
					db_name = "cocaine",
					time = 3000,
					max = 1000,
					add = 1,
					remove = 1,
					requires = "nothing",
					requires_name = "Nothing",
					drop = 100
				}
			},
			Hint = _U("dd_pickup"),
		},
		
		
		coke_pooch = {
			Pos = {x = -2076.68, y = 2612.61, z = 3.55},
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 0, g = 0, b = 0},
			Marker = 1,
			Blip = false,
			Name = _U("dd_cocaine"),
			Item = {
				{
					name = _U("coke_pooch"),
					db_name = "coke_pooch",
					time = 3000,
					max = 1000,
					add = 1,
					remove = 5,
					requires = "cocaine",
					requires_name = "Nothing",
					drop = 100
				}
			},
			Hint = _U("dd_pickup"),
		},
		
		
		meth = {
			Pos = {x = 27.92, y = 3662.88, z = 40.44},
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = false,
			Name = _U("dd_cocaine"),
			Item = {
				{
					name = _U("dd_cocaine"),
					db_name = "cocaine",
					time = 3000,
					max = 40,
					add = 1,
					remove = 1,
					requires = "nothing",
					requires_name = "Nothing",
					drop = 100
				}
			},
			Hint = _U("dd_pickup"),
		},
		
		
		meth_pooch = {
			Pos = {x = 453.34, y = -1305.11, z = 30.12},
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 0, g = 0, b = 0},
			Marker = 1,
			Blip = false,
			Name = _U("dd_cocaine"),
			Item = {
				{
					name = _U("dd_cocaine"),
					db_name = "meth_pooch",
					time = 3000,
					max = 40,
					add = 1,
					remove = 1,
					requires = "meth",
					requires_name = "Nothing",
					drop = 100
				}
			},
			Hint = _U("dd_pickup"),
		}
	}
}
