local Keys = {
["ESC"] = 322,
["F1"] = 288,
["F2"] = 289,
["F3"] = 170,
["F5"] = 166,
["F6"] = 167,
["F7"] = 168,
["F8"] = 169,
["F9"] = 56,
["F10"] = 57,
["~"] = 243,
["1"] = 157,
["2"] = 158,
["3"] = 160,
["4"] = 164,
["5"] = 165,
["6"] = 159,
["7"] = 161,
["8"] = 162,
["9"] = 163,
["-"] = 84,
["="] = 83,
["BACKSPACE"] = 177,
["TAB"] = 37,
["Q"] = 44,
["W"] = 32,
["E"] = 38,
["R"] = 45,
["T"] = 245,
["Y"] = 246,
["U"] = 303,
["P"] = 199,
["["] = 39,
["]"] = 40,
["ENTER"] = 18,
["CAPS"] = 137,
["A"] = 34,
["S"] = 8,
["D"] = 9,
["F"] = 23,
["G"] = 47,
["H"] = 74,
["K"] = 311,
["L"] = 182,
["LEFTSHIFT"] = 21,
["Z"] = 20,
["X"] = 73,
["C"] = 26,
["V"] = 0,
["B"] = 29,
["N"] = 249,
["M"] = 244,
[","] = 82,
["."] = 81,
["-"] = 84,
["LEFTCTRL"] = 36,
["LEFTALT"] = 19,
["SPACE"] = 22,
["RIGHTCTRL"] = 70,
["HOME"] = 213,
["PAGEUP"] = 10,
["PAGEDOWN"] = 11,
["DELETE"] = 178,
["LEFT"] = 174,
["RIGHT"] = 175,
["TOP"] = 27,
["DOWN"] = 173,
["NENTER"] = 201,
["N4"] = 108,
["N5"] = 60,
["N6"] = 107,
["N+"] = 96,
["N-"] = 97,
["N7"] = 117,
["N8"] = 61,
["N9"] = 118
}

Config = {}

Config.CheckOwnership = true -- If true, Only owner of vehicle can store items in trunk.
Config.AllowPolice = true -- If true, police will be able to search players' trunks.

Config.Locale = "en"

Config.OpenKey = Keys["L"]

-- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 25000

-- Default weight for an item:
-- weight == 0 : The item do not affect character inventory weight
-- weight > 0 : The item cost place on inventory
-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 1000

Config.localWeight = {

 alive_chicken = 200,
 slaughtered_chicken = 500,
 packaged_chicken = 1000,
 fish = 100,
 stone = 300,
 washed_stone = 1000,
 cutted_wood = 500,
 packaged_plank = 500,
 petrol_raffin = 500,    
 essence = 500,
 whool = 500 ,
 clothe = 500,
 plongee = 2000,
 plongee = 2000,
 coke = 500,
 coke_pooch = 500,
 opium = 500,
 opium_pooch = 500,
 binoculars = 200,
 raw_ore= 100 ,
 gazbottle = 500,
 fixtool = 500,
 carotool = 500,
 blowpipe = 500,
 fixkit = 500,
 carokit = 500,
 repairkit = 500,
 clip = 2000,
 yusuf = 500,
 grip = 500,
 flashlight = 500,
 silencieux = 500,
 fishbait = 10,
 fishingrod = 10,
 shark = 3000,
 shark_pro = 200,
 wale_pro = 300,
 wale = 5000,
 turtle_pro = 100,
 turtle = 1000,
 turtlebait = 100,
 blackberry = 500,
 jumelles = 200,
 bandage = 50,
 medikit = 100,
 gps = 1000,
 croquettes = 100,
 gym_membership = 1000,
 powerade = 100,
 sportlunch = 100,
 protein_shake = 100,
 meth = 200,
 meth_pooch = 400,
 weed_pooch = 400,
 cannabis = 200,
 marijuana = 1000,
 laranja = 500,
 sumo_de_laranja = 100,
 meat = 500,
 milk_cow = 300,
 milk_pro = 400,
 milking_machine = 2000,
 grill = 2000,
 poteto = 200,
 lay_b = 300,
 Algae_a = 300,
 Seaweed_b = 500,
 sand = 500,
 glass = 1000,
 shovel = 200,
 hatchet_lj = 200,
 sfish = 200,
 mfish = 500,
 lfish = 200,
 lrod = 500,
 lbait = 100,
 lUbait = 500,
 lEbait = 100,
 contract = 100,
 radio = 600,
 umbrella = 100,
 picnic = 1000,
 donut = 1000,
 oxygen_mask = 1000,
 rose = 100,
 bulletproof = 1000,
 redgull = 200,
 copper = 500,
 iron = 600,
 gold = 700,
 diamond = 1000,
 copper_package = 1000,
 iron_package = 1000,
 gold_package = 1000,
 diamond_package = 1000,
 chicken = 500,
 chickenwithoutfeather = 500,
 chicken_meat = 500,
 chicken_package = 1000,
 knife_chicken = 200,
 wool = 500,
 clothe = 100,
 fabric = 500,
 wool = 500,
 scissor = 200,
 bottle = 20,
 pork = 500,
 porkpackage = 500,
 phone = 200,
 rope = 200,
 milk_package = 600,
 milk_engine = 200,
 leather = 500,
 cloth = 500,
 oil_a = 500,
 oil_b = 500,
 honey_a = 300,
 honey_b = 200,
 rice = 300,
 rice_pro = 200,
 sickle = 200,
 shell_a = 100, 
 shell_b = 200,
 acabbage = 200,
 bcabbage = 300,
 mushroom = 200,
 mushroom_d = 300,
 mushroom_p = 400,
 drill = 1000,
 gunpowder = 200,
 saw = 200, 
 steel = 300,
 beer = 50,
 bread = 50,
 chocolate = 100,
 cigarett = 1,
 cocacola = 200,
 coffe = 200,
 cupcake = 100,
 hamburger = 100,
 icetea = 500,
 lighter = 50,
 milk = 300,
 sandwich = 100,
 tequila = 500,
 vodka = 500,
 water = 50,
 whisky = 100,
 wine = 100,
 prawnbait = 100,
 bong = 100,
 lockpick = 200,
 battery = 3000,
 lowradio = 2000,
 stockrim = 1500,
 airbag = 2000,
 highradio = 3000,
 highrim = 2000,
 gold_o = 500,
 items = 500,
 chest_a = 500,
 sands = 500,
 meat_a = 300,
 leather_a = 200,
 meat_w = 5000,
 copper = 100,
 iron = 300,
 gold = 200,
 diamond = 200,
 wood = 500,
 pro_wood = 300,
 petrol = 500,
 fabric = 500,
 shell_c = 400,
 SteelScrap = 500,
 bobbypin = 100,
 meat_zzz = 500,
 handcuffs = 200,
 handcuff = 750,		
 handcuffs = 750,		
 headbag = 500,		
 key = 200,
 joias = 1000,
 mask = 500,
 rasperry = 1000,
 Carbon_fiber = 100,
 spring = 100,
 energy = 350,
 alarminterface = 1200,
 hammerwirecutter = 800,
 jammer = 500,
 hat_w = 500,
 cocaine = 200,
 marijuana_cigarette = 100,
 squid = 200,
 squidbait = 200,
 toolskit = 450,
 tool_salt = 200,
 tool_engine = 550,
 vine = 500,
 advanced_scope = 900,
 compansator = 900,
 flashlight = 900,
 armor = 200,
 barrel = 100,
 fmj = 300,
 hollow = 200,
 tracer_clip = 1200,
 lazer_scope = 500,
 incendiary = 550,
 metreshooter = 100,
 scope = 2000,
 silent = 1500,
 very_extended_magazine = 900,
 nightvision_scope = 900,
 extended_magazine = 650,
 thermal_scope = 900,
 pecas = 250,
 grip = 1250,
 c4_bank = 1500,
 lowrider = 500,
 nurek = 2000,
 a_clar = 80,
 a_durian = 120,
 a_engine = 150,
 a_salt = 100,
 crab = 200,
 crab_pro = 250,
 cactus = 200,
 echinopsis = 300,
 airbag = 300,
 bag = 500,
 armor = 150,
 b_clar = 80,
 b_durian = 120,
 b_engine = 200,
 sicklecrab = 100,
 b_salt = 120,
 bait = 80,
 farine = 500,
 Ciment_a = 2000,
 blowpipe = 150,
 blowtorch = 150,
 handcuffs_key = 500,
 handcuffs = 600,
 ami_key = 100,
 ami_police = 100,
 ami_ambulance = 100,
 ami_mechanic = 100,
 raisin = 400,
 jus_raisin = 400,
 grand_cru = 400,
 jusfruit = 600,
 brolly = 300,
 grapperaisin = 150,
 bolchips = 600,
 bolnoixcajou = 250,
 bolpistache = 250,
 defibrillateur = 300,
 poubelle = 700,
 latex = 500,
 borracha = 1000,
 borracha_embalada = 500,
 licensa = 500,
 milkbucket = 1500,
 milkpet = 800,
 unlockingtool = 700,
 WEAPON_STUNGUN = 50,
 WEAPON_BAT = 500,
 WEAPON_KNUCKLE = 500,
 WEAPON_GOLFCLUB = 500,
 WEAPON_HAMMER = 500,
 WEAPON_HEAVYPISTOL = 100, 
 WEAPON_COMBATPISTOL = 100, 
 black_money = 0.01,

}

--[[Config.VehicleLimitModel = {
    ["Panto"] = 15000,
	["blista"] = 25000,
	["cog55"] = 25000,
	["issi2"] = 25000,
	["issi3"] = 25000,
	["kamacho"] = 30000,
	["premier"] = 25000,
	["rhapsody"] = 20000,
	["schafter2"] = 25000,
	["stafford"] = 30000,
	["superd"] = 30000,
	["brawler"] = 25000,
	["rebel2"] = 35000,
	["asea"] = 25000,
	["emperor"] = 30000,
	["primo"] = 25000,
	["warrener"] = 25000,
	["brio"] = 15000,
	["casco"] = 25000,
	["michelli"] = 25000,
	["pigalle"] = 30000,
	["zion2"] = 30000,
	["Lynx"] = 25000,
	["z4"] = 25000,
	["carbonizzare"] = 25000,
	["guardian"] = 40000,
	["z190"] = 40000,
	["dominator"] = 30000,
	["dominator3"] = 30000,
	["f620"] = 25000,
	["kuruma"] = 30000,
	["baller2"] = 40000,
	["bjxl"] = 45000,
	["minivan"] = 40000,
	["serrano"] = 40000,
	["bison"] = 40000,
	["burrito3"] = 40000
}]]--
Config.VehicleLimit = {
[0] = 5000, --Compact
[1] = 20000, --Sedan
[2] = 20000, --SUV
[3] = 20000, --Coupes
[4] = 40000, --Muscle
[5] = 20000, --Sports Classics
[6] = 10000, --Sports
[7] = 10000, --Super
[8] = 5000, --Motorcycles
[9] = 60000, --Off-road
[10] = 60000, --Industrial
[11] = 70000, --Utility
[12] = 40000, --Vans
[13] = 0, --Cycles
[14] = 40000, --Boats
[15] = 0, --Helicopters
[16] = 0, --Planes
[17] = 40000, --Service
[18] = 40000, --Emergency
[19] = 0, --Military
[20] = 60000, --Commercial
[21] = 0 --Trains
}

Config.VehiclePlate = {
taxi = "TAXI",
cop = "LSPD",
ambulance = "EMS0",
mecano = "MECA"
}