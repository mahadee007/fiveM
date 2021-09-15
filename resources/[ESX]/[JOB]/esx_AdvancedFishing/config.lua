Config = {}
	---------------------------------------------------------------
	--=====How long should it take for player to catch a fish=======--
	---------------------------------------------------------------
	--Time in miliseconds
	Config.FishTime = {a = 20000, b = 40000}
	
	Config.Cop = 4
	
	--------------------------------------------------------
	--=====Prices of the items players can sell==========--
	--------------------------------------------------------
	--First amount minimum price second maximum amount (the amount player will get is random between those two numbers)
	Config.FishPrice = {a = 200, b = 220} --Will get clean money THIS PRICE IS FOR EVERY 5 FISH ITEMS (5 kg)
	Config.TurtlePrice = {a = 200, b = 300} --Will get dirty money
	Config.SharkPrice = {a = 1500, b = 2000} --Will get dirty money
	Config.walePrice = {a = 2500, b = 3500} 

	--------------------------------------------------------
	--=====Locations where players can sell stuff========--
	--------------------------------------------------------

	Config.SellFish = {x = -1521.54, y = 1493.41, z = 111.0} --Place where players can sell their fish
	Config.SellTurtle = {x = 3823.41, y = 4442.0, z = 2.0} --Place where players can sell their turtles 
	Config.SellShark = {x = 2517.6 , y = 4218.0, z = 38.8} --Place where players can sell their sharks
	Config.Sellwale = {x = -1612.284 , y = -994.227, z = 13.017}

	--------------------------------------------------------
	--=====Locations where players can rent boats========--
	--------------------------------------------------------
Config.MarkerZones = { 
	
    {x = -3424.48   ,y = 974.46 ,z = 7.35, xs = -3426.2  , ys = 942.4, zs = 1.1 },
	

}