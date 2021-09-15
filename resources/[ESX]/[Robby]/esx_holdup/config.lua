Config = {}
Config.Locale = 'en'

Config.PoliceNumberRequired = 5  --- number of cops needed to be on set to zero for none
Config.TimerBeforeNewRob = 1800 -- seconds --- how long untill the next robbery is  

Config.MaxDistance    = 20 -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.GiveBlackMoney = true -- give black money? If disabled it will give cash instead.

Config.MaxSameTime = 0

-- Change secondsRemaining if you want another timer
Stores = {
    ["paleto_twentyfourseven"] = {
        position = { ['x'] = 1736.32092285156, ['y'] = 6419.4970703125, ['z'] = 35.037223815918 },
        reward = math.random(30000,60000),
        nameofstore = "24/7. (Paleto Bay)",
        secondsRemaining = 900, 
        lastrobbed = 0
    },
    ["sandyshores_twentyfoursever"] = {
        position = { ['x'] = 1961.24682617188, ['y'] = 3749.46069335938, ['z'] = 32.3437461853027 },
        reward = math.random(30000,60000),
        nameofstore = "24/7", --ร้านค้าใกล้ สน.ทะเลทราย
        secondsRemaining = 900,
        lastrobbed = 0
    },
    ["bar_one"] = {
        position = { ['x'] = 1990.579, ['y'] = 3044.957, ['z'] = 47.215171813965 },
        reward = math.random(30000,60000),
        nameofstore = "Yellow Jack. (ร้านบาร์ทะเลทราย)",
        secondsRemaining = 900, 
        lastrobbed = 0
    },
    ["ocean_liquor"] = {
        position = { ['x'] = -2959.33715820313, ['y'] = 388.214172363281, ['z'] = 14.0432071685791 },
        reward = math.random(30000,60000),
        nameofstore = "Robs Liquor", --ร้านค้าไฮเวย์
        secondsRemaining = 900, 
        lastrobbed = 0
    },
    ["sanandreas_liquor"] = {
        position = { ['x'] = -1219.85607910156, ['y'] = -916.276550292969, ['z'] = 11.3262157440186 },
        reward = math.random(30000,60000),
        nameofstore = "Robs Liquor", --ร้านค้าแดง
        secondsRemaining = 900, 
        lastrobbed = 0
    },
    ["grove_ltd"] = {
        position = { ['x'] = -43.4035377502441, ['y'] = -1749.20922851563, ['z'] = 29.421012878418 },
        reward = math.random(30000,60000),
        nameofstore = "LTD Gasoline", --ร้านค้าปั้มล่างสุด
        secondsRemaining = 900, 
        lastrobbed = 0
    },
    ["mirror_ltd"] = {
        position = { ['x'] = 1160.67578125, ['y'] = -314.400451660156, ['z'] = 69.2050552368164 },
        reward = math.random(30000,60000),
        nameofstore = "LTD Gasoline", --ร้านค้าขวาสุดของแมพ
        secondsRemaining = 900, 
        lastrobbed = 0
    },
    ["littleseoul_twentyfourseven"] = {
        position = { ['x'] = -709.17022705078, ['y'] = -904.21722412109, ['z'] = 19.215591430664 },
        reward = math.random(30000,60000),
        nameofstore = "24/7", --ร้านค้าปั้มน้ำมันล้างรถ
        secondsRemaining = 900,
        lastrobbed = 0
    }
	
}
