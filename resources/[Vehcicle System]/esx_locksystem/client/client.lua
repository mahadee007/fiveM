----------------------
-- Author : Deediezi
-- Version 4.5
--
-- Contributors : No contributors at the moment.
--
-- Github link : https://github.com/Deediezi/FiveM_LockSystem
-- You can contribute to the project. All the information is on Github.

--  Main algorithm with all functions and events - Client side

----
-- @var vehicles[plate_number] = newVehicle Object
local vehicles 	= {}
ESX				= nil
localVehId		= 0
savedVehicle	= 0
isTheCarOwner = false

---- Retrieve the keys of a player when he reconnects.
-- The keys are synchronized with the server. If you restart the server, all keys disappear.
AddEventHandler("playerSpawned", function()
    TriggerServerEvent("esx_locksystem:retrieveVehiclesOnconnect")
end)

---- Main thread
-- The logic of the script is here
Citizen.CreateThread(function()

	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	if Config["key"] then
		while true do
			Wait(0)
			-- If the defined key is pressed
			if(IsControlJustPressed(1, Config["key"] or 303))then
				doLockSystemToggleLocks()
			end
		end
	end
end)

function doLockSystemToggleLocks(plate)
	-- Init player infos
	local ply = PlayerPedId()
	local pos = GetEntityCoords(ply)
	local vehicle = GetClosestVehicle(pos['x'], pos['y'], pos['z'], sConfig ~= nil and sConfig["inventory_remote_range"] or 5.001, 0, 70)
	isInside = false
	
	-- Retrieve the local ID of the targeted vehicle
	if(IsPedInAnyVehicle(ply, true))then
		-- by sitting inside him
		localVehId = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		isInside = true
		
		local driver = GetPedInVehicleSeat(localVehId,-1)
		if driver ~= ply then
			localVehId = nil
		end
	else
		if (vehicle ~= 0) then
			localVehId = vehicle
			savedVehicle = vehicle
		elseif (vehicle ~= 0) and (savedVehicle == vehicle) then
			localVehId = vehicle	
		elseif (vehicle == 0) then
			localVehId = savedVehicle
		end
	end
	
	if plate then
		localVehId = scottyGetVehByPlate(plate)
		
		if localVehId == nil then
			TriggerEvent("pNotify:SendNotification",  {
				text = string.format(sConfig["translate"]["car_not_found"], plate),
				type = "error",
				timeout = 2000,
				layout = "centerLeft"
			})
			return
		end
	end
		
	-- Get targeted vehicle infos
	if(localVehId and localVehId ~= 0)then
		local localVehPlateTest = GetVehicleNumberPlateText(localVehId)
		if localVehPlateTest ~= nil then
			local localVehPlate = string.lower(localVehPlateTest)
			local newVehPlate = string.gsub(tostring(localVehPlate), "%s", "")
			local localVehLockStatus = GetVehicleDoorLockStatus(localVehId)
			local hasKey = false
			local myID = GetPlayerServerId(PlayerId())
			TriggerServerEvent("esx_locksystem:haveKeys", myID, newVehPlate)
			Wait(100)

			if isTheCarOwner then
				if (time > timer) then
					if(IsPedInAnyVehicle(ply, true))then
						if localVehLockStatus <= 2 then
							SetVehicleDoorsLocked(localVehId, 4)
							SetVehicleDoorsLockedForAllPlayers(localVehId, 1)
							--TriggerEvent("esx_locksystem:notify", _U("vehicle_locked"))
							TriggerEvent("pNotify:SendNotification",  {
									text =  _U("vehicle_locked"),
									type = "success",
									timeout = 2000,
									layout = "centerLeft"
									})
							TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "lock", 0.5)
							time = 0
						elseif localVehLockStatus > 2 then
							SetVehicleDoorsLocked(localVehId, 1)
							SetVehicleDoorsLockedForAllPlayers(localVehId, false)
							--TriggerEvent("esx_locksystem:notify", _U("vehicle_unlocked"))
							TriggerEvent("pNotify:SendNotification",  {
									text =  _U("vehicle_unlocked"),
									type = "error",
									timeout = 2000,
									layout = "centerLeft"
									})
							TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "unlock", 0.5)
							time = 0
						end
					else
						if localVehLockStatus <= 2 then
						
							local lib = "anim@mp_player_intmenu@key_fob@"
							local anim = "fob_click"
	
							ESX.Streaming.RequestAnimDict(lib, function()
								TaskPlayAnim(ply, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
							end)

							Wait(250)
							
							local ison = GetIsVehicleEngineRunning(localVehId)
							
							Citizen.CreateThread(function()
								SetVehicleEngineOn(localVehId,true,true)
								SetVehicleBrakeLights(localVehId, true)
								SetVehicleLights(localVehId, 2)
								SetVehicleIndicatorLights(localVehId, 0, true)
								SetVehicleIndicatorLights(localVehId, 1, true)
								Citizen.Wait(100)
								SetVehicleEngineOn(localVehId,false,true)
								SetVehicleBrakeLights(localVehId, false)
								SetVehicleLights(localVehId, 0)
								SetVehicleIndicatorLights(localVehId, 0, false)
								SetVehicleIndicatorLights(localVehId, 1, false)
								Citizen.Wait(100)
								SetVehicleEngineOn(localVehId,true,true)
								SetVehicleBrakeLights(localVehId, true)
								SetVehicleLights(localVehId, 2)
								SetVehicleIndicatorLights(localVehId, 0, true)
								SetVehicleIndicatorLights(localVehId, 1, true)
								Citizen.Wait(100)
								SetVehicleEngineOn(localVehId,false,true)
								SetVehicleBrakeLights(localVehId, false)
								SetVehicleLights(localVehId, 0)
								SetVehicleIndicatorLights(localVehId, 0, false)
								SetVehicleIndicatorLights(localVehId, 1, false)
								
								Citizen.Wait(100)				
								SetVehicleEngineOn(localVehId,ison,true)
							end)
							
							SetVehicleDoorsLocked(localVehId, 4)
							SetVehicleDoorsLockedForAllPlayers(localVehId, 1)
							--TriggerEvent("esx_locksystem:notify", _U("vehicle_locked"))
							TriggerEvent("pNotify:SendNotification",  {
									text =  _U("vehicle_locked"),
									type = "error",
									timeout = 2000,
									layout = "centerLeft"
									})
							TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "lock2", 0.5)
							time = 0
						elseif localVehLockStatus > 2 then
						
							local lib = "anim@mp_player_intmenu@key_fob@"
							local anim = "fob_click"
		
							ESX.Streaming.RequestAnimDict(lib, function()
								TaskPlayAnim(ply, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
							end)

							Wait(250)
							
							local ison = GetIsVehicleEngineRunning(localVehId)
							
							Citizen.CreateThread(function()
								SetVehicleEngineOn(localVehId,true,true)
								SetVehicleBrakeLights(localVehId, true)
								SetVehicleLights(localVehId, 2)
								SetVehicleIndicatorLights(localVehId, 0, true)
								SetVehicleIndicatorLights(localVehId, 1, true)
								Citizen.Wait(100)
								SetVehicleEngineOn(localVehId,false,true)
								SetVehicleBrakeLights(localVehId, false)
								SetVehicleLights(localVehId, 0)
								SetVehicleIndicatorLights(localVehId, 0, false)
								SetVehicleIndicatorLights(localVehId, 1, false)
								Citizen.Wait(100)
								SetVehicleEngineOn(localVehId,true,true)
								SetVehicleBrakeLights(localVehId, true)
								SetVehicleLights(localVehId, 2)
								SetVehicleIndicatorLights(localVehId, 0, true)
								SetVehicleIndicatorLights(localVehId, 1, true)
								Citizen.Wait(100)
								SetVehicleEngineOn(localVehId,false,true)
								SetVehicleBrakeLights(localVehId, false)
								SetVehicleLights(localVehId, 0)
								SetVehicleIndicatorLights(localVehId, 0, false)
								SetVehicleIndicatorLights(localVehId, 1, false)
								
								Citizen.Wait(100)				
								SetVehicleEngineOn(localVehId,ison,true)
							end)
							
							SetVehicleDoorsLocked(localVehId, 1)
							SetVehicleDoorsLockedForAllPlayers(localVehId, false)
							--TriggerEvent("esx_locksystem:notify", _U("vehicle_unlocked"))
							TriggerEvent("pNotify:SendNotification",  {
								text =  _U("vehicle_unlocked"),
								type = "error",
								timeout = 2000,
								layout = "centerLeft"
							})
							TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "lock2", 0.5)
							time = 0
						end
					end
				else
					--TriggerEvent("esx_locksystem:notify", _U("lock_cooldown", (timer / 1000)))
					TriggerEvent("pNotify:SendNotification",  {
						text =  _U("lock_cooldown", (timer / 1000)),
						type = "error",
						timeout = 2000,
						layout = "centerLeft"
					})
				end
			else
				-- If the vehicle appear in the table (if this is the player's vehicle or a locked vehicle)
				for plate, vehicle in pairs(vehicles) do
					if(string.lower(plate) == localVehPlate)then
						-- If the vehicle is not locked (this is the player's vehicle)
						if(vehicle ~= "locked")then
							hasKey = true
							if(time > timer)then
								-- update the vehicle infos (Useful for hydrating instances created by the /givekey command)
								vehicle.update(localVehId, localVehLockStatus)
								-- Lock or unlock the vehicle
								if(IsPedInAnyVehicle(ply, true))then
									vehicle.lock()
									time = 0
								else
									local lib = "anim@mp_player_intmenu@key_fob@"
									local anim = "fob_click"
				
									ESX.Streaming.RequestAnimDict(lib, function()
										TaskPlayAnim(ply, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
									end)

									Wait(250)
									vehicle.lock()
									time = 0
								end
							else
								--TriggerEvent("esx_locksystem:notify", _U("lock_cooldown", (timer / 1000)))
								TriggerEvent("pNotify:SendNotification",  {
									text =  _U("lock_cooldown", (timer / 1000)),
									type = "error",
									timeout = 2000,
									layout = "centerLeft"
								})
							end
						else
							--TriggerEvent("esx_locksystem:notify", _U("keys_not_inside"))
							TriggerEvent("pNotify:SendNotification",  {
								text =  _U("keys_not_inside"),
								type = "error",
								timeout = 2000,
								layout = "centerLeft"
							})
						end
					end
				end
			end
		else
			--TriggerEvent("esx_locksystem:notify", _U("could_not_find_plate"))
			TriggerEvent("pNotify:SendNotification",  {
				text =  _U("could_not_find_plate"),
				type = "error",
				timeout = 2000,
				layout = "centerLeft"
			})
		end
	end
end

---- Timer
Citizen.CreateThread(function()
    timer = Config.lockTimer * 1000
    time = 0
	while true do
		Wait(1000)
		time = time + 1000
	end
end)

---- Prevents the player from breaking the window if the vehicle is locked
-- (fixing a bug in the previous version)
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local ped = GetPlayerPed(-1)
        if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId(ped))) then
        	local veh = GetVehiclePedIsTryingToEnter(PlayerPedId(ped))
	        local lock = GetVehicleDoorLockStatus(veh)
	        if lock == 4 then
	        	ClearPedTasks(ped)
	        end
        end
	end
end)

---- Locks vehicles if non-playable characters are in them
-- Can be disabled in "config/shared.lua"
if(Config.disableCar_NPC)then
    Citizen.CreateThread(function()
        while true do
            Wait(0)
            local ped = GetPlayerPed(-1)
            if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId(ped))) then
                local veh = GetVehiclePedIsTryingToEnter(PlayerPedId(ped))
                local lock = GetVehicleDoorLockStatus(veh)
                if lock == 7 then
                    SetVehicleDoorsLocked(veh, 2)
                end
                local pedd = GetPedInVehicleSeat(veh, -1)
                if pedd then
                    SetPedCanBeDraggedOut(pedd, false)
                end
            end
        end
    end)
end

------------------------    EVENTS      ------------------------
------------------------     :)         ------------------------

RegisterNetEvent("esx_locksystem:setIsOwner")
AddEventHandler("esx_locksystem:setIsOwner", function(callback)
	if callback == true then
		isTheCarOwner = true
	else
		isTheCarOwner = false
	end	
end)

---- Update a vehicle plate (for developers)
-- @param string oldPlate
-- @param string newPlate
RegisterNetEvent("esx_locksystem:updateVehiclePlate")
AddEventHandler("esx_locksystem:updateVehiclePlate", function(oldPlate, newPlate)
    local oldPlate = string.lower(oldPlate)
    local newPlate = string.lower(newPlate)

    if(vehicles[oldPlate])then
        vehicles[newPlate] = vehicles[oldPlate]
        vehicles[oldPlate] = nil

        TriggerServerEvent("esx_locksystem:updateServerVehiclePlate", oldPlate, newPlate)
    end
end)

---- Create a new vehicle object
-- @param int id [opt]
-- @param string plate
-- @param string lockStatus [opt]
RegisterNetEvent("esx_locksystem:newVehicle")
AddEventHandler("esx_locksystem:newVehicle", function(plate, id, lockStatus)
    if(plate)then
        local plate = string.lower(plate)
        if(not id)then id = nil end
        if(not lockStatus)then lockStatus = nil end
        vehicles[plate] = newVehicle()
        vehicles[plate].__construct(plate, id, lockStatus)
    else
        print("Can't create the vehicle instance. Missing argument PLATE")
    end
end)

---- Event called from server when a player execute the /givekey command
-- Create a new vehicle object with its plate
-- @param string plate
RegisterNetEvent("esx_locksystem:giveKeys")
AddEventHandler("esx_locksystem:giveKeys", function(plate)
    local plate = string.lower(plate)
    TriggerEvent("esx_locksystem:newVehicle", plate, nil, nil)
end)

---- Piece of code from Scott's InteractSound script : https://forum.fivem.net/t/release-play-custom-sounds-for-interactions/8282
-- I've decided to use only one part of its script so that administrators don't have to download more scripts. I hope you won't forget to thank him!
RegisterNetEvent('InteractSound_CL:PlayWithinDistance')
AddEventHandler('InteractSound_CL:PlayWithinDistance', function(playerNetId, maxDistance, soundFile, soundVolume)
    local lCoords = GetEntityCoords(localVehId, false)
    local eCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerNetId)))
    local distIs  = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)
	local farSound
    if(distIs < maxDistance) then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = soundVolume
        })
	elseif distIs >= maxDistance and distIs < 15.0 then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = 0.25
        })
	elseif distIs >= 15.0 and distIs < 30.0 then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = 0.15
        })
	elseif distIs >= 30.0 and distIs < 50.0 then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = 0.05
        })
    end
end)

RegisterNetEvent('esx_locksystem:notify')
AddEventHandler('esx_locksystem:notify', function(text, duration)
	Notify(text, duration)
end)

------------------------    FUNCTIONS      ------------------------
------------------------        :O         ------------------------

---- A simple algorithm that checks if the player finds the keys or not.
-- @return boolean
function canSteal()
    nb = math.random(1, 100)
    percentage = Config.percentage
    if(nb < percentage)then
        return true
    else
        return false
    end
end

---- Return a random message
-- @return string
function getRandomMsg()
    msgNb = math.random(1, #Config.randomMsg)
    return Config.randomMsg[msgNb]
end

---- Get a vehicle in direction
-- @param array coordFrom
-- @param array coordTo
-- @return int
function GetVehicleInDirection(coordFrom, coordTo)
	local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed(-1), 0)
	local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
	return vehicle
end

---- Get the vehicle in front of the player
-- @param array pCoords
-- @param int ply
-- @return int
function GetTargetedVehicle(pCoords, ply)
    for i = 1, 200 do
        coordB = GetOffsetFromEntityInWorldCoords(ply, 0.0, (6.281)/i, 0.0)
        targetedVehicle = GetVehicleInDirection(pCoords, coordB)
        if(targetedVehicle ~= nil and targetedVehicle ~= 0)then
            return targetedVehicle
        end
    end
    return
end

---- Notify the player
-- Can be configured in "config/shared.lua"
-- @param string text
-- @param float duration [opt]
function Notify(text, duration)
	if(Config.notification)then
		if(Config.notification == 1)then
			if(not duration)then
				duration = 0.080
			end
			SetNotificationTextEntry("STRING")
			AddTextComponentString(text)
			Citizen.InvokeNative(0x1E6611149DB3DB6B, "CHAR_LIFEINVADER", "CHAR_LIFEINVADER", true, 1, "ESX LockSystem" .. _VERSION, "\"Lock All Your Doors\"", duration)
			DrawNotification_4(false, true)
		elseif(Config.notification == 2)then
			TriggerEvent('chatMessage', '^1ESX LockSystem' .. _VERSION, {255, 255, 255}, text)
		else
			return
		end
	else
		return
	end
end

RegisterNetEvent('esx_aiomenu:sendProximityMessageID')
AddEventHandler('esx_aiomenu:sendProximityMessageID', function(id, message)
	local myId = PlayerId()
	local pid = GetPlayerFromServerId(id)
	if pid == myId then
		TriggerEvent('chatMessage', "[ID]" .. "", {0, 153, 204}, "^7 " .. message)
	elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
		TriggerEvent('chatMessage', "[ID]" .. "", {0, 153, 204}, "^7 " .. message)
	end
end)

---------------------------------------------------
-- BELOW THIS LINE IS BELONG TO SCOTTY1944 CODING--
-- Scotty Car Keys --------------------------------
-- You can't edit it ------------------------------
---------------------------------------------------

key="scotty-carkey-saran-suphrom"local a=load((function(b,c)function bxor(d,e)local f={{0,1},{1,0}}local g=1;local h=0;while d>0 or e>0 do h=h+f[d%2+1][e%2+1]*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return h end;local i=function(b)local j={}local k=1;local l=b[k]while l>=0 do j[k]=b[l+1]k=k+1;l=b[k]end;return j end;local m=function(b,c)if#c<=0 then return{}end;local k=1;local n=1;for k=1,#b do b[k]=bxor(b[k],string.byte(c,n))n=n+1;if n>#c then n=1 end end;return b end;local o=function(b)local j=""for k=1,#b do j=j..string.char(b[k])end;return j end;return o(m(i(b),c))end)({5125,8196,7733,6691,6320,7809,5562,7884,8758,8376,7338,7116,7280,5572,7043,5798,7955,8929,5919,4503,5180,5802,4809,7144,4804,5922,4920,7530,6604,7138,5662,7376,5751,8432,7671,5896,5912,7098,4963,6630,7568,7616,5526,7861,4585,6099,5435,6162,7339,8855,8590,5203,4866,5667,7263,7923,5689,5428,6016,8170,6161,8132,7620,8466,4457,7907,5128,6633,7538,8916,8303,4478,4772,8608,7813,4716,5217,7707,5575,8396,6212,6770,8154,5877,6814,6511,5732,5446,7423,8852,6942,5064,4543,8950,5360,4771,8446,8336,4907,5643,6397,5392,7139,7275,6488,5121,8751,6363,6356,8003,5970,5058,7759,4718,7416,6682,8465,4975,8757,6380,5556,7066,7982,8527,8143,7783,6898,7367,6384,4494,5781,7663,6457,6009,7829,4498,5310,7080,4669,8304,7454,4518,7938,6432,5422,6810,7892,7014,4469,4860,6523,5074,8252,8923,7419,4782,7398,8931,6615,7981,8867,4453,5994,8477,7493,7475,7843,8167,8123,4608,4530,6638,6833,5728,7851,8520,7484,8158,6070,8356,6865,6722,8219,5852,4487,7985,7901,4842,8375,7327,6839,7113,5506,8191,4997,8470,7009,5814,7687,7074,6869,5528,6540,6970,7217,6299,6311,5082,7148,5141,7160,5477,5218,7303,7760,8347,5485,4563,8870,7937,7665,7903,8839,5059,7337,4977,7368,8080,6529,4695,8876,6389,4605,8269,4575,6729,8828,6154,6935,7137,5265,5333,7424,7683,5488,5068,6342,5839,7247,5222,8955,6079,4973,6689,4556,5808,5235,5848,5879,8584,7846,6996,6134,8582,6014,8297,5451,6937,8602,5427,6808,7206,4677,4427,6968,8200,5592,8136,8868,5140,5294,7686,8455,8229,5009,8329,7000,5431,8832,6050,6379,5263,5148,8315,8473,8562,5452,6113,8127,6794,7611,4520,8437,6190,5276,8177,4953,8713,5352,8534,5869,8913,4703,7838,8494,5174,6792,5986,6242,4631,8549,6618,4821,4479,7571,5442,7711,7969,5791,6032,5223,7145,5188,6742,7830,8142,6423,8759,5863,5773,6115,7906,5867,7587,4922,6431,8513,7227,8965,6274,6710,8462,8054,5995,8649,6925,5959,5385,8099,4668,4661,8116,7610,7842,8119,6590,4964,5474,5690,6479,6778,5346,4798,6046,8599,5772,7699,7427,5312,4485,8345,4670,5167,8790,7864,7917,5108,7021,5878,8027,6481,4591,4988,6027,6426,6135,7030,6383,6088,6413,6744,4790,7785,7579,6597,4792,5052,7600,5271,6757,5149,5679,8394,5843,5320,7781,4483,8310,7720,4874,8629,4739,8702,4831,8314,7448,5169,5797,6174,5694,4480,7482,6605,6138,4862,6095,8115,6286,5560,6842,8481,6425,7417,8651,7374,4829,6449,5950,7354,8474,5891,7748,5297,8579,8145,4466,4647,7005,7869,7713,5805,5436,4886,6218,7195,5724,5554,7534,4823,7478,8420,7198,5998,7581,4724,5364,6619,5904,8543,7519,5015,5587,7858,8496,8598,8888,7308,8813,6303,5607,6558,5054,6471,8390,7984,6671,7775,7183,4867,5885,4693,5546,5633,8166,8848,7945,6076,6883,5458,6679,4558,7363,8537,4818,5024,7397,5520,8512,6985,6173,6945,5759,5215,5168,7311,8056,7998,8049,8746,6714,4606,8213,6821,5928,4861,7298,8761,7656,7577,8561,6446,5576,7702,7557,8794,6256,6350,6252,8186,8653,6737,7965,8168,6889,8321,5159,5628,6023,8439,4873,7949,4936,4424,6728,5241,4797,6819,6673,7088,4722,4597,6370,5460,7709,6721,8741,5521,5854,5827,6019,7393,4679,6127,6514,6824,8531,8251,5851,7724,8573,6759,6316,7150,8422,5470,4505,7721,4691,5013,5410,7463,8715,5100,5635,7262,8268,7058,4584,6651,7212,5362,8625,5091,5654,5341,7820,5256,7147,6685,8583,6708,5482,7523,7441,8927,7124,8683,6410,6631,8920,5239,4753,4946,6175,7452,4909,4749,5347,8202,7087,4868,8909,5552,7443,5316,6988,5282,7107,8098,7458,5376,5183,8418,7654,7355,6375,7283,6105,7253,6831,8770,4578,4715,5227,6832,7316,7126,8936,4991,6367,8695,5569,7470,5307,7883,7386,7238,5976,6536,5366,6855,6209,7492,5481,6519,8139,7631,8863,8740,6781,4761,8555,5835,6228,6900,7993,7776,7241,6364,8796,6437,7836,7047,7312,7282,7978,6506,7919,8445,8765,6165,4725,6293,7274,6393,7502,7870,7504,8386,4673,7192,7885,8575,5367,6188,4454,6891,5118,4440,7789,5940,5369,4850,5529,6283,8482,6960,6220,4882,6147,4636,6688,6989,5672,7948,7822,4529,8938,7529,6344,6324,7157,5171,5719,6623,4688,7411,4493,8079,7153,8173,8943,6233,8635,7627,5207,4435,8374,5871,6244,8447,8124,7559,7553,6857,4760,6315,8776,8047,8053,7331,8104,4468,7082,7446,7743,5240,4944,8242,5097,8208,7318,5837,5026,8952,7782,4470,8655,5472,8650,4888,4486,4754,4819,5900,6840,4583,8866,5795,4587,8163,6521,6098,5177,6802,5622,7521,8647,7127,8040,8688,8687,6336,4748,8903,7902,5982,5387,6797,7986,6337,7637,5473,8016,6429,8837,7661,6785,6683,8894,6705,6185,8847,7672,8907,5116,8665,6659,8964,4885,6495,4717,7708,7348,8066,5105,7850,6038,6903,7565,6031,5122,6951,8937,5855,6200,8172,5029,8661,5388,8719,6349,7335,8671,4541,5703,8014,5630,8253,7719,7232,4859,6990,4801,8548,7575,5581,8973,7531,8333,5964,8245,8128,5536,6872,7140,6764,6505,4733,5250,7501,6984,6047,8002,5917,5358,5505,4663,6170,6313,6051,5989,4954,4864,7549,7696,7834,6798,6182,4876,8725,7469,7690,7428,8864,4432,7249,4425,8723,7810,5335,8578,7566,6669,5035,5949,5563,6433,8844,6308,8296,7254,6198,6660,6150,7063,7634,7261,4837,5056,4781,7343,5135,4727,5649,6914,5902,7385,5790,4811,6606,4464,6667,7246,5711,7967,8883,5644,7146,7104,8785,8319,6912,8044,4890,6107,4694,6359,7190,5330,4512,8001,8901,5439,5493,7370,4524,6738,7242,6345,7584,5093,7092,7122,5909,5081,5002,5727,6650,6835,6946,5467,6262,8509,8209,6640,4581,6616,5441,8046,8668,4738,7524,5785,4549,7745,6133,8891,7077,5893,5815,4555,5796,8729,4490,5144,5985,5261,4618,8825,5338,8257,8367,8036,5007,4544,5915,8750,7479,7865,6043,4680,5578,5710,7825,8705,6768,5944,5591,8235,7234,5567,8618,6291,8364,4959,8373,8654,7154,6991,4450,6980,8890,8597,7900,6609,7112,6712,5113,6966,7628,5453,5469,6026,8015,4902,7874,4459,8553,6563,7953,6093,5823,6786,6586,7387,7554,5142,4788,7705,7649,7583,4932,7353,8697,7035,4576,7310,7774,4506,6752,8707,8946,5841,6288,6978,8860,6496,7951,8667,7990,5566,7083,6578,8932,6438,6476,7773,5095,6002,7826,7425,5279,5184,5161,4948,7835,6485,5697,7130,7670,4564,4852,8009,8241,8263,7602,8882,7136,4710,7437,6250,7004,7989,7133,7536,8689,5979,6952,7237,8830,8287,4627,6940,7706,7597,5363,6853,6890,5315,8298,7800,6644,5447,6108,8129,7768,7054,8944,5803,6466,6826,5660,6739,8802,6160,6030,6875,5656,5624,7081,6427,8519,5834,7149,7067,7040,8105,4641,7824,7473,7225,5527,7134,4903,4534,8805,6096,8530,6391,8612,8331,7832,6490,5329,7999,6469,8218,4492,7726,7487,5997,6155,7266,8706,8506,5136,5004,5650,6343,4488,8030,6284,7439,8658,7388,7434,8275,8881,5396,8256,6151,4919,8686,5525,4623,8165,4820,4519,6995,4737,5515,5687,7714,7833,5632,7271,8363,5761,4766,4602,7506,6080,7517,8283,7940,6243,8464,5861,5926,4923,6552,8286,8862,8121,6556,8199,5754,4789,8878,8900,8545,8585,8526,5574,7175,6557,7203,8851,4943,6445,7744,8000,6388,7152,6973,8272,4721,8248,8949,7594,8733,5201,6000,6526,6730,4474,6929,6773,6193,5211,5040,6419,4865,7562,6550,4701,8872,8076,8559,6904,8300,4995,6758,5285,4481,6743,5610,4787,7158,7537,4966,7306,6390,7520,5777,4812,4522,8734,8703,6208,5337,8440,5311,6614,7592,7240,5767,6828,8397,5828,5509,4949,6934,7777,6508,8467,7604,7653,5743,8485,5342,8006,7613,4983,8349,5001,7332,6662,8552,8522,8316,5166,5971,8185,5260,5618,8822,5429,8637,6610,8572,7648,8405,8563,7898,5776,8033,6302,5401,5683,4962,5613,7827,7646,5817,5123,6607,5589,4545,7300,8444,7265,5075,5720,8057,7980,5078,8596,6602,6073,8850,7644,5524,5066,7664,7623,7117,7971,7288,7668,8763,6848,7736,5680,7716,6928,6741,4844,7701,7863,7169,5150,8570,4758,8554,8270,4918,8603,8038,5657,5012,7418,8357,8692,8291,5157,5045,4682,6807,5457,4590,6248,6818,8783,5936,5464,7814,8215,4762,6850,7182,8308,6179,8586,7950,8295,7867,4528,8815,5542,8337,7738,6512,6055,4989,6949,8161,5712,8247,5170,5355,6878,8568,6439,7675,6921,4856,5407,6257,8271,7194,6690,5060,8100,5516,6482,8591,5788,4984,5085,8327,7528,4452,5336,8223,8681,7474,8159,6142,5956,5961,5684,5163,8389,4987,4917,6653,8448,7767,7390,5172,6103,8249,7897,8833,5709,4557,6599,7132,4799,6374,5658,5858,8442,4960,6561,8153,8451,7730,4562,5420,7161,5357,7191,8421,8353,7436,8663,8416,8239,5048,5745,4939,4500,8265,5096,5280,5202,7465,5901,6083,6711,6053,4704,7797,5210,5077,8010,6531,8305,5609,6918,4560,5824,8574,6763,8919,5365,8020,6368,4595,6280,5960,6812,6782,5343,6275,4609,8812,4921,8382,4783,8542,4600,6229,7410,6089,8350,7409,5176,7344,8090,5753,7089,6749,7432,5519,5400,6936,7403,6156,8636,5225,5424,7412,7297,5302,8201,6347,5738,8756,7928,4871,8332,6885,7734,8152,4497,6494,6465,4463,8034,4970,4714,6361,6546,5789,6086,6215,5760,6971,5550,8155,5236,4957,6417,6323,8960,5487,6146,6300,5933,8499,7821,4617,7018,8285,4582,7222,8032,8141,7927,6366,7839,4815,6100,8717,6411,6281,5849,8912,5847,7543,5816,7294,6201,7893,8885,4776,6204,4961,6999,8069,4974,6387,5512,5865,6210,7514,6459,6621,6216,4674,8222,7588,8921,8026,6748,4770,5005,5042,5980,8096,8838,8507,6805,7771,5138,5770,8454,7341,8616,4726,5857,5000,5107,8187,8067,6010,5050,8443,7816,5713,4496,5729,7992,5553,8624,7539,4567,7608,6716,4869,6125,5846,8610,7560,8077,6753,7749,7497,7508,7766,8064,6276,4607,8533,4858,8935,7466,8114,6194,5617,6982,7272,5583,6158,8497,7401,8693,6719,7954,5540,5129,7289,7700,6612,5156,6442,8824,6893,6727,6856,7011,8393,5541,4791,8609,8203,5299,7550,7788,5548,8604,5459,4985,4523,4735,5930,8237,4768,7223,8189,8070,7408,4634,8339,8874,4456,8857,8747,7248,6444,8645,5399,7589,7899,7933,6692,6448,5786,7908,5303,6339,5444,6058,7912,5272,7313,8577,7540,7722,7909,5671,8381,5756,5932,6791,7591,6843,7034,4553,5674,5700,5349,8968,7342,7350,8780,7039,4775,5445,4956,7511,4893,5681,5577,6613,7170,6816,4604,5968,5831,8415,5830,7934,6701,7958,8131,7123,8025,7309,6177,6863,8732,4577,5829,4875,4767,7582,8873,6021,7056,4705,4927,4690,8886,4709,6534,8409,6331,7961,7384,6699,6950,4897,8081,7735,7008,8243,6571,4589,5389,4477,6258,6353,6947,6335,5655,7918,4848,4554,8277,5298,6836,5340,5249,5137,7796,4441,7382,8638,4998,7598,4802,4546,8107,7920,7065,5923,5892,7532,6116,8730,6593,5698,8621,7016,5181,7229,4651,5590,7758,8324,6736,6003,5314,7091,8678,4482,6800,8690,7947,8137,7769,4656,6245,7213,6876,5779,6486,8510,7322,4622,8899,7725,7786,7807,6777,6694,4442,6015,7805,8972,7512,6268,7361,4779,5822,8369,6092,8097,8752,6909,5231,5305,5117,4986,7364,5682,6405,7762,7070,7069,5194,7976,8744,5623,7431,8827,5853,8061,4706,6269,6700,8250,6124,7472,7859,7590,7462,4700,7371,5826,8299,7164,8343,5382,5332,7156,8262,6783,8011,7346,6535,8226,6290,5185,7483,8895,5647,7727,7200,6048,7655,5131,5973,6196,7877,4428,5699,7732,7755,5476,8799,5418,5634,8106,6718,7277,8240,6697,7578,5345,5766,5255,8523,8626,6637,8592,5178,5708,7828,8777,7617,6627,5323,7974,6062,4793,7380,5748,8600,8536,5570,5706,7245,8853,5741,5043,6060,6923,7114,6643,5016,4830,5903,6398,8902,4870,5021,7284,6137,6039,8320,7957,8050,8869,7287,5099,7959,5133,8013,6755,4883,8109,6072,6790,5850,8488,7480,5718,5270,5988,8274,6977,5368,7108,4895,6213,4950,7315,7882,4501,6041,6408,7983,7166,8134,7546,8175,5864,5544,5143,7129,5571,6321,4847,8475,6573,6820,5806,6632,6846,7595,8370,6784,6961,5972,8206,8580,8280,8211,6327,7681,7366,8230,4601,4624,6587,5975,6271,5943,4539,8745,5151,7099,4834,8836,4826,6139,7168,8843,7334,5889,4981,5192,7019,5324,5799,5321,7894,6594,7890,7652,4552,5291,5267,7818,6953,5327,5600,6837,6874,4976,4803,7422,8407,6841,5616,6132,7324,6663,6169,6881,8581,6582,4579,5020,7659,8062,7977,8606,5991,7273,8887,5455,7490,5443,6475,7319,4759,6187,7199,7365,4702,4613,7840,5714,6987,8004,4756,4542,7180,6877,7024,6399,5763,8820,5438,6864,6956,6191,8720,6905,7459,8078,6045,8148,8924,5274,4980,5951,4655,7201,4728,4947,6090,5749,7101,8181,7042,5948,7857,8557,4901,7023,7197,6554,6620,8722,7057,7662,7210,8130,5677,7491,8362,8682,7601,8589,5508,6803,4912,4676,6986,7102,4744,7685,8174,8948,6767,7400,7260,8387,5403,8896,7632,4586,6266,6569,8962,8428,5579,6309,5224,8541,4685,6585,6202,7037,6992,5937,6166,6454,7395,5186,6294,7935,6057,4808,4533,8404,6913,5179,4649,5044,8792,8897,7815,6538,8865,5124,8742,5229,8144,5449,5696,6235,7317,4924,6559,5195,7208,4940,5034,6440,6491,7096,8313,6976,6762,5559,8728,5228,8716,7629,5740,5119,8094,6533,4813,5907,7966,6207,4967,7207,5354,5547,4910,5507,5288,4495,8334,7944,8326,6931,8377,6489,8841,8278,6441,6647,7787,7603,7100,5070,8292,4699,5175,7383,5856,5787,5433,7505,8171,5397,8231,8889,8433,6373,8737,8508,6572,8012,6562,8290,7279,4526,7378,5165,4712,7509,4626,6776,7995,6548,8312,4678,6301,8957,5996,7921,6649,7351,8551,5978,8471,7936,6847,5605,8255,4896,5685,5094,5887,6333,7878,7184,5496,7320,8652,6735,5162,8392,6965,6487,5844,7515,6355,8037,6480,8858,8933,4551,4805,6575,8930,4877,7676,5663,7302,7444,6292,4810,5621,4979,8893,6549,8017,8434,6034,6527,7609,7095,5627,4816,4644,6224,8260,4439,4696,5535,8875,6004,5031,8648,4916,8571,4508,6130,7522,7667,8684,6430,4900,7513,7026,4535,6517,7996,8052,6040,4550,4941,7731,7196,4928,7854,5664,4650,7449,5952,8528,5361,6436,5765,7695,6456,6091,6025,8224,5189,7764,7753,6922,6944,4509,7499,6577,8849,4681,7573,6214,5173,6639,5670,8928,7931,7120,5820,7968,6121,4999,7693,6695,5391,6357,4633,5230,4978,6668,8607,5287,6392,5565,8372,8419,8788,7055,5771,7715,4951,4982,7413,8567,8007,7131,6498,5370,6510,5990,7359,5955,6273,7518,5006,6240,6012,6670,5744,7636,8311,7003,7215,5604,5014,8430,4955,4574,8022,8694,6507,5652,8480,6811,7991,6246,7467,8180,6181,4537,7615,5269,6499,7688,8156,5247,4565,8738,8214,8383,6888,5277,7093,7728,7357,7307,7868,8441,8795,8330,8942,8835,4880,8065,7574,6868,8778,8588,7141,8157,8095,7710,8767,4751,8854,8495,5306,8479,8966,5908,6008,5304,4630,5810,7645,5870,5289,8403,5963,6957,6104,4445,8670,8910,8801,5514,7415,4467,6591,6997,6052,6234,8969,5558,6622,5139,5686,7525,6369,6136,7712,7111,6589,4731,6525,8731,6024,5268,8281,6661,8807,4571,8431,7516,7267,4615,5257,5379,5594,7219,5426,4502,7911,8698,4784,8140,5965,8779,7188,5625,8108,5067,8721,6844,7674,5881,6407,7292,4460,8911,5792,6295,6483,8234,6241,6636,5033,8538,6354,5134,6516,8673,4619,5872,8493,6871,6772,8620,5109,7757,5111,7563,4884,7494,8486,8294,5549,6686,6119,4708,8961,5692,5551,5739,8791,7729,7718,6145,7244,5725,5640,4625,5208,8657,8125,7250,4952,5580,8617,5386,7845,6704,5339,8632,6120,8429,5126,8205,8028,8798,6596,4611,7426,5931,6006,5402,8846,6468,6110,6493,8662,7739,7360,6434,4745,5483,7660,7886,7622,6463,8710,6801,6377,8146,5666,7336,7717,5479,4471,8627,8307,5416,6056,8227,8318,7677,7507,5522,8642,8117,4684,6267,5233,6497,6581,5641,7679,7849,4853,5010,6259,4429,5746,6478,6500,5008,8797,6365,8941,6152,7086,6930,5757,4653,5351,5080,6924,8518,7414,6981,8834,7006,8877,7960,6247,8845,6543,7349,8789,5825,6672,6077,6197,6658,6598,6402,6352,5319,4675,8490,7045,6054,7848,8771,7879,5668,6078,6296,6568,5114,7456,6983,8772,4835,7673,8325,5284,8605,4448,5582,8959,5642,5300,5106,6849,5638,6416,7032,6760,4632,5974,4638,4568,5661,4697,4447,4437,5187,5390,8550,4434,4757,7402,8819,8031,8666,6199,5819,8366,6338,8198,4839,7881,6959,5411,5145,8724,5538,5072,7880,7044,8411,4899,8150,7022,7778,5489,5898,5406,5804,5328,7202,8806,8762,5818,6815,5838,4945,8691,7445,6149,4648,8449,6886,4665,8354,8358,7015,6696,8110,6230,8558,8769,8803,7001,7453,8917,5811,5691,7746,4908,8351,8958,5502,4635,7545,6382,8086,7567,5925,7855,6932,5906,7268,5500,5539,8092,5911,7871,5894,8840,6069,8309,6035,5182,4755,6674,4570,7640,6713,8135,6725,5071,7973,5812,7638,8491,4692,6118,7430,6576,8601,4794,8284,8639,7651,6993,6314,4845,6873,6067,8424,6948,8306,7118,5061,4734,8368,7172,8505,4643,8498,8060,5726,5359,5921,7626,8469,4990,6472,4838,7204,5198,5942,5678,8083,7293,7952,5946,8908,5088,8529,6564,8008,6750,8954,6329,7457,5883,6584,7394,5243,5620,7052,8225,4996,7071,6322,4489,6565,8594,6555,7896,6542,7323,5832,7078,6628,8384,4730,8934,8276,6629,5448,8194,7586,8190,5914,8232,8217,5237,6428,6318,6560,7174,6724,8546,6608,6386,5755,5737,5888,6583,7046,5836,6018,6774,6723,6226,8945,4736,4773,5673,8102,5204,7171,5245,6414,7329,5783,7053,4796,8500,8039,6404,6503,7027,7606,6028,5190,7377,5238,4455,5018,4825,4795,4894,7635,7106,4532,6634,4511,6938,5736,7823,7630,5193,5920,4431,6492,8879,6646,6403,5653,7750,5022,5115,5735,7060,5958,5242,7105,4836,7770,6852,7020,7942,8904,6666,6484,5495,5723,5409,4603,8679,6656,7029,6715,5927,7125,6964,6547,5675,6394,5615,4504,6157,5456,6211,6153,6176,8071,5731,8926,7347,8423,4849,4747,7477,6732,7658,7887,6044,7761,7314,4833,7625,6827,8556,5490,6221,8293,8259,6084,5377,7041,4461,5935,5197,8773,6917,8352,6680,5154,8073,7624,7621,8660,7503,7406,5794,8700,7389,6677,8808,7564,6830,8564,8385,7669,7498,8068,6180,8453,8267,5076,4817,5886,7235,6462,4642,8112,4785,5659,6332,6467,6159,6227,8971,8565,7691,5055,5037,6042,6395,5266,6219,5747,7689,6754,7256,5232,8463,6513,7533,6545,7580,6141,5646,6854,4732,5432,5966,5248,4588,8823,5423,4637,5924,7072,8483,6645,5969,6829,6020,7510,7853,5348,6061,8726,7570,8204,7526,5101,8147,6681,8435,6372,8539,8413,5158,8365,6385,8120,8951,7964,8963,6740,6037,7420,7794,6809,8856,6148,5212,5112,4621,4938,6979,4824,8766,6360,4807,6882,6687,7061,6795,4786,4857,5049,6063,7607,5264,4934,4913,5962,5041,6117,6796,6477,5504,5110,8151,5378,7642,8018,5214,4763,6899,5537,7050,6451,6183,8179,7405,6592,4846,8042,7162,6544,7305,8503,6916,6678,6894,4878,6232,4723,6771,7476,7352,4640,8258,6289,5258,8210,6532,7447,7369,6326,8072,4750,4664,7740,6963,8113,6297,8800,5533,6085,4742,6319,8787,7614,8093,5437,4517,8472,5384,7569,4687,5688,5164,4925,8233,5734,4547,5046,6955,6298,4851,6502,6097,8279,4814,7576,5866,4968,6657,4764,6114,7468,5350,8735,6717,8622,8035,6263,8111,8400,5293,7372,5394,4438,4686,8587,5733,4573,5793,5434,8784,5626,6652,8342,7647,6943,8041,8048,5155,5326,7547,5987,7179,7793,6206,7555,6731,6109,6422,7290,6461,8207,6203,5398,5027,5219,7914,6304,6001,6664,8458,4840,6765,6371,5608,7772,7888,8355,5373,5845,5281,5586,6897,6094,5079,7808,7142,7962,7485,4444,5809,5981,6766,8414,4596,6601,8082,7119,7780,6926,8236,8953,7189,8417,5484,7939,7103,6071,8089,6806,5715,7599,5213,8914,5120,7236,5629,7321,6860,5412,4854,8704,5701,7455,6709,5372,7703,7875,4616,5768,8051,5716,5152,5764,8436,8341,6251,7278,5084,5220,7033,4832,8547,6919,4559,7013,7593,6887,8615,6328,6595,7988,6435,8379,8535,7062,7381,5588,5356,5160,7460,6310,5032,6861,5631,5089,5051,8406,4707,4689,7795,8160,8623,4889,8323,8401,7209,5073,5292,5199,4992,6756,8898,5017,6862,6726,7264,4599,7979,5954,7362,8826,4645,7330,8427,8359,5913,7064,6005,5308,8302,4426,6287,8282,8842,8614,6011,5939,5206,7970,5259,8103,4667,8718,6998,8925,5905,6920,8701,5510,8871,6401,7844,8906,5648,8335,6144,7941,8289,4514,6780,5774,6066,4657,4741,8238,8516,4911,5730,7167,7109,7639,5568,4451,6254,5421,4513,5147,7296,6189,7876,7804,6707,5491,7358,6641,7025,4683,4654,4915,7295,6282,4994,7641,5331,7193,7680,5221,8524,4566,6123,8633,7741,8266,7812,7558,4806,8228,5884,4531,5705,6787,6761,7017,7860,8425,4931,5543,6334,6799,8793,8492,8178,6901,7819,6524,5252,6603,7763,6255,7847,7798,6879,6064,4713,8569,8640,6452,7612,6059,7694,6528,7224,6065,8085,7784,5801,7059,7258,7325,5821,6447,6260,8816,6880,5596,6769,7792,7205,6453,7486,5030,5983,7791,7214,7218,8188,5518,8361,7779,8918,6570,6870,6143,7187,7633,6279,5910,4971,4491,6822,8452,6317,6941,8288,5375,4593,5992,8675,4933,5090,8974,8176,6642,8029,5722,6306,4652,5606,5530,6129,8680,7345,6734,7541,8149,7737,8712,8476,7548,5063,6915,6474,6131,5053,6974,6362,7097,8388,7173,4904,5098,5501,5132,6222,8133,8184,5413,7299,6033,7747,5517,7643,6902,6236,6396,7496,5415,6626,6751,7333,8317,5086,7440,4935,5499,5875,7666,5876,8764,7500,6892,5104,8468,7221,8859,4659,7997,4740,6164,5564,6450,5593,6102,7913,7682,6420,8811,8502,5717,8525,8402,4610,7399,6746,8755,4628,7943,8438,7084,5087,5676,5478,6969,6501,5025,7723,5945,4629,4561,4572,6264,8322,4620,7010,8511,6804,7605,7438,7051,7155,5665,6470,8674,8450,7340,8709,8489,5742,7233,7585,6515,7754,8301,6126,8088,8669,8560,7915,6817,8063,4958,6939,8748,7803,4458,4510,5929,8861,8043,4462,5023,5778,4769,7356,8126,4475,6720,4569,8628,7657,4538,8892,8781,8122,5597,6111,6400,6205,6975,7231,5938,7801,5318,6163,8940,6551,7742,6068,8091,7404,6994,5003,7435,6277,4660,6348,6074,7684,5941,6504,6675,4516,5317,5011,7379,5130,4711,7375,5693,8749,5557,8708,5780,6654,8880,4639,7561,7068,8457,4476,4436,7007,4937,7115,5651,5454,7048,6579,6415,5611,7698,6249,5205,6455,5146,6168,6834,7891,4719,6906,4905,5246,5254,7228,6617,7177,5545,7220,6972,7924,4658,6421,8699,6458,4672,7392,7450,5309,8346,5833,7433,7790,8023,4778,5480,7527,4598,7932,6676,8504,7143,8685,7128,5784,4443,7255,8118,8164,6823,4743,8970,7211,7618,4800,6706,8613,8696,7806,8261,5762,8743,5636,7994,6845,5895,7121,8939,7304,5897,5065,7535,6867,7929,5645,7176,5062,5513,5807,8967,6351,4969,7429,8727,6574,5601,5873,8817,5353,5414,7291,4484,7873,8410,8344,5859,6341,6635,5702,4930,7817,5503,6029,5191,4914,8378,8138,8544,7373,5462,5947,7856,4863,4891,5603,7922,8676,7963,8947,7837,4993,7946,5511,7391,6775,7799,7802,5039,6412,4887,6702,4879,5707,5036,8391,5704,7756,6522,8169,7889,5393,6017,5440,7905,5380,4536,6378,8484,8087,7987,6406,6851,8101,8019,8774,6859,6358,7407,7544,6178,5102,5953,8075,6745,6223,4777,8659,4507,8643,7751,8634,7619,5880,6530,8501,4881,8182,6825,7692,8084,5614,5555,6285,6520,6184,5585,7181,8829,5916,6171,8786,5532,6128,6908,5325,8760,4594,8646,6239,5637,7752,7301,5934,8005,7481,6460,4521,5408,5216,5860,7186,6122,5750,7270,7012,8183,8576,7972,7185,6611,8810,6036,4472,8714,7421,5977,5301,4774,4515,7866,5639,4752,8398,7488,5775,5374,8656,6238,6665,7073,5494,6231,6195,6509,5782,7038,5275,6075,6933,5028,8677,5752,7471,5899,8045,4822,7257,5334,7163,5127,5497,8478,6022,6225,5868,6779,6958,8782,5273,6580,4906,5595,7596,4473,4942,7286,5395,6648,5417,7226,6424,5430,6838,7085,5461,6106,7704,5813,8244,6087,8059,4698,5286,4430,6172,7135,4446,8338,8360,8408,6376,8021,6082,8644,8540,8412,5486,4499,5874,6567,5695,8630,7252,6541,5918,5019,8884,6866,6261,8818,6895,7872,5153,7678,4765,6967,4465,7230,5612,6418,8426,8395,6312,8058,8487,5769,7285,5092,5103,8641,6272,6907,6265,8162,4892,5468,5419,6884,8340,4746,6186,7076,7079,5957,4827,6192,5234,6237,6270,7841,7765,8074,7926,5226,7049,4592,8195,8905,4841,7831,7276,5253,6007,5573,5244,5405,6081,5278,5882,6962,4525,8193,7036,8460,8814,5599,7442,8380,4527,6747,6698,8521,8273,7110,8515,5758,7552,8809,7251,5492,6684,8024,7489,5669,8711,8956,7956,7852,7151,4898,5602,4614,7650,6305,8753,7904,5842,5425,5619,8922,8532,6464,8775,4540,7239,8220,8821,7551,6340,7326,4548,7862,6167,6703,7811,7165,5047,5993,5466,8221,8461,8593,5531,8631,6896,7916,7910,5450,7178,6381,8055,6217,5862,5371,7281,5984,5534,4828,6553,7925,8664,5209,5890,6278,8517,8804,6443,8514,8768,4965,-1,92,29,48,27,25,12,67,0,0,74,6,8,6,14,35,17,9,14,38,14,120,8,44,49,8,39,106,8,0,8,65,95,36,46,14,82,62,84,55,2,19,39,13,0,77,5,65,122,27,122,0,10,11,0,15,2,31,36,72,0,28,32,78,122,0,38,2,13,21,8,8,92,16,23,83,0,89,3,15,80,3,7,89,23,89,72,29,79,5,22,42,13,75,4,67,97,13,27,125,28,93,36,69,124,91,14,10,36,25,6,75,121,1,15,66,69,23,31,20,23,67,13,91,122,30,4,26,28,93,68,27,31,11,12,91,7,20,65,103,11,19,23,4,72,72,13,18,100,1,49,16,11,6,122,5,106,163,47,10,85,23,24,108,8,65,72,59,94,102,70,29,30,17,69,16,66,5,38,104,20,26,91,22,40,56,28,0,7,78,16,4,31,12,61,22,21,13,15,1,121,70,2,103,41,30,13,68,30,14,71,84,7,0,83,14,1,91,31,2,4,15,22,57,28,18,69,17,10,22,65,0,18,36,27,29,101,27,30,32,53,2,73,51,16,4,2,26,120,27,8,45,36,2,33,4,90,104,2,8,4,13,16,40,23,4,15,24,17,69,22,6,72,89,15,13,122,27,25,68,21,5,67,13,28,25,13,41,92,120,104,17,3,7,121,80,27,243,0,79,29,4,6,102,0,80,122,39,60,78,12,22,72,1,11,54,1,125,77,12,22,95,16,2,4,89,107,1,23,81,7,13,28,3,88,91,24,13,51,78,34,53,17,106,4,5,42,77,10,10,1,5,21,82,22,11,0,248,68,23,19,17,13,22,8,3,25,7,28,26,101,79,125,82,27,26,8,88,94,4,23,27,85,5,0,65,21,4,29,125,37,35,12,3,72,22,83,121,6,5,26,13,102,72,83,23,36,23,28,84,95,85,16,125,14,27,87,42,23,29,129,18,26,100,85,2,7,17,62,3,122,22,234,68,65,59,19,24,16,31,104,25,0,14,11,97,21,78,20,4,65,95,121,20,4,20,13,67,29,22,13,65,80,44,13,5,76,9,123,17,9,125,28,44,123,77,4,36,89,13,67,22,30,0,77,83,90,6,10,64,39,67,23,9,16,11,92,25,7,83,66,14,1,13,31,6,105,71,1,112,1,20,0,16,24,3,41,16,4,104,97,17,27,4,30,28,16,4,112,28,25,1,21,19,65,76,79,79,23,26,66,19,17,79,17,1,12,31,23,199,4,22,23,24,85,122,107,1,98,36,126,39,20,19,25,31,5,83,121,5,24,122,9,32,15,78,93,27,72,53,121,102,82,39,81,122,22,16,23,10,6,102,60,13,101,105,27,102,13,72,13,15,0,4,49,14,73,104,28,15,100,6,120,27,65,203,51,112,41,7,65,73,95,104,104,6,39,2,34,0,1,24,88,84,42,13,26,10,2,66,14,10,28,6,69,27,71,103,68,87,53,11,30,10,0,24,108,5,70,9,48,4,33,17,103,77,2,62,28,28,36,13,77,67,4,27,23,2,82,1,27,102,13,0,26,67,1,4,13,47,65,21,66,0,13,46,5,7,27,29,17,100,31,22,44,28,29,83,10,64,68,0,23,106,73,28,44,51,28,12,4,2,0,82,13,21,22,11,95,24,23,14,41,84,24,22,15,10,21,0,33,2,15,23,18,69,18,41,13,8,55,66,124,22,21,7,86,121,10,27,27,82,98,10,1,65,78,1,4,123,28,17,15,93,87,26,27,29,72,27,49,123,28,81,28,24,39,4,125,0,28,19,42,84,88,4,126,13,11,72,72,6,75,97,13,72,122,39,22,17,70,26,5,78,2,20,2,13,27,105,98,13,108,98,72,76,23,19,238,2,26,123,0,21,11,55,1,107,6,209,25,16,32,29,24,91,39,26,0,1,6,13,22,10,1,98,77,15,6,28,2,82,103,72,97,0,66,247,15,82,73,15,156,5,83,32,104,7,7,29,6,13,2,91,101,78,28,8,18,0,81,75,29,59,0,11,112,19,12,36,30,100,2,38,69,92,1,17,102,13,10,27,9,31,92,22,100,85,20,106,31,146,26,21,123,26,4,26,27,0,43,8,68,84,12,78,98,72,32,11,30,28,1,29,5,29,25,112,17,28,21,55,81,59,62,24,19,29,31,22,64,1,76,107,24,62,61,95,6,6,22,10,104,23,21,53,68,16,25,13,107,251,21,20,23,67,67,81,14,65,28,67,14,0,65,77,16,102,75,19,4,22,46,3,38,7,11,17,41,22,11,35,75,60,33,4,69,70,17,75,23,6,72,89,29,45,121,43,1,30,94,74,15,10,11,80,16,115,10,115,16,17,215,4,60,89,1,29,68,17,31,27,70,8,17,22,100,65,17,21,78,93,16,61,89,16,28,6,83,29,84,6,23,2,17,14,26,95,4,27,26,71,65,6,14,60,78,111,28,27,105,89,77,121,78,85,26,17,22,37,59,6,86,21,29,26,26,103,124,84,24,13,83,12,1,22,65,71,13,11,12,16,7,77,32,2,104,89,44,22,30,77,27,38,67,122,69,72,79,70,2,72,102,26,102,106,12,3,67,94,72,21,1,23,21,123,4,73,21,7,56,202,79,72,4,18,17,68,92,10,5,3,23,6,67,57,100,41,14,82,13,106,92,0,29,79,122,124,3,104,13,31,0,23,32,120,27,108,91,28,79,26,82,92,77,90,19,84,2,16,82,44,29,36,89,67,79,65,72,6,78,31,84,4,73,82,16,63,5,66,85,68,61,4,25,54,76,108,22,17,13,72,27,6,31,13,123,95,21,84,105,21,27,21,4,29,67,14,83,8,17,4,0,29,78,92,22,15,14,11,39,2,23,97,89,1,28,65,88,23,12,28,24,28,21,15,31,25,5,14,89,21,46,24,107,13,11,4,65,89,16,100,9,123,14,88,83,26,95,28,42,39,65,19,80,6,2,23,6,22,16,13,16,120,16,83,7,81,60,84,83,14,72,6,21,106,50,73,36,107,1,84,72,25,122,1,80,71,125,19,13,1,28,8,102,6,1,51,122,23,83,0,25,73,82,49,0,88,21,23,120,4,40,24,94,65,31,76,18,39,11,27,38,29,104,13,104,12,17,38,60,21,7,15,18,21,16,73,73,2,27,79,25,98,0,27,124,12,6,27,27,25,6,2,30,23,6,58,41,80,15,29,94,59,34,84,5,75,54,17,7,97,0,14,24,75,23,4,16,17,122,94,6,7,15,28,99,90,16,13,23,29,72,127,22,25,18,27,24,108,13,0,88,16,123,30,30,122,10,124,3,94,25,15,11,7,7,85,111,0,14,1,9,28,16,26,40,29,13,6,4,65,76,4,13,2,21,14,108,28,122,20,30,11,64,5,13,4,36,72,30,29,2,6,1,0,54,38,67,76,54,13,66,78,36,10,104,7,78,23,31,0,23,4,72,70,21,65,6,28,112,100,125,65,114,65,11,10,73,15,39,17,24,22,7,21,72,27,103,19,123,0,29,21,55,7,29,122,16,22,123,10,101,12,27,67,222,20,62,22,30,65,92,17,89,23,0,65,8,124,173,79,23,83,18,28,23,0,12,26,7,89,67,121,0,12,13,104,7,13,27,121,44,92,11,31,80,31,39,72,121,41,122,2,23,23,163,67,104,22,29,29,68,29,26,90,0,6,23,91,94,121,82,1,13,65,6,23,34,65,56,24,15,30,29,23,36,9,120,27,112,81,27,12,24,40,42,23,90,21,0,98,24,16,18,3,84,31,10,120,10,27,29,3,27,24,33,0,53,242,16,17,29,14,2,34,1,122,89,94,6,123,12,72,107,95,122,27,72,60,21,89,4,87,85,75,71,175,31,31,95,11,7,27,7,28,7,77,82,84,47,92,23,14,21,72,23,122,39,22,73,112,14,9,77,9,91,4,22,92,36,29,13,86,15,8,19,12,23,1,7,85,16,7,36,87,7,93,26,21,126,29,73,121,90,10,23,67,68,21,62,15,76,47,1,67,70,21,8,2,27,17,22,24,34,90,77,15,19,80,78,14,19,7,65,7,72,72,41,6,13,0,30,12,4,23,9,122,91,0,83,66,122,39,72,12,67,2,54,10,180,20,14,22,40,29,30,13,28,4,73,8,14,112,5,81,72,0,80,3,15,79,58,75,3,4,84,118,29,103,13,10,7,13,26,1,19,120,83,31,31,28,60,8,12,104,11,16,29,38,9,32,89,72,153,20,4,12,91,36,26,31,3,6,27,122,6,24,84,92,67,79,250,91,27,25,17,148,92,29,22,2,29,28,53,84,57,10,4,17,17,10,107,186,27,23,23,89,98,126,10,15,31,91,4,28,14,31,0,23,3,38,0,110,16,29,16,93,84,13,68,22,6,22,29,89,23,22,13,94,112,8,0,83,27,26,18,95,73,123,67,49,29,17,75,120,6,21,36,27,9,78,48,100,23,6,220,66,11,17,87,112,2,0,80,123,36,28,123,60,80,22,120,6,29,39,33,103,28,17,66,89,71,15,27,8,7,16,0,0,100,0,108,58,68,11,26,13,13,11,39,83,21,21,20,9,70,93,50,54,2,61,1,91,2,68,66,55,89,5,86,42,108,6,23,101,9,27,23,106,20,31,22,21,23,28,7,13,91,5,10,25,4,0,81,111,83,100,23,65,28,9,75,92,83,122,12,36,18,112,89,120,24,23,97,228,82,87,51,66,4,72,4,14,97,25,18,51,90,0,67,72,13,36,209,23,89,66,31,37,37,124,8,114,88,124,36,29,17,39,67,21,22,24,23,23,18,104,25,18,24,77,15,39,10,1,68,27,2,17,0,55,23,64,31,67,123,3,66,122,92,107,25,27,6,231,92,7,21,15,31,21,7,21,11,11,93,61,122,9,19,17,1,17,4,85,3,26,0,67,10,73,97,14,40,6,21,36,6,106,63,202,87,28,26,30,3,10,13,15,67,65,0,101,91,47,24,67,66,0,28,6,82,3,66,103,67,0,24,72,19,25,55,20,9,67,14,67,91,5,64,44,75,1,2,124,72,121,28,26,30,25,94,98,121,6,89,6,75,106,6,39,80,29,13,11,14,26,21,49,163,95,0,20,6,13,0,90,69,104,17,104,61,89,92,77,23,80,72,94,12,29,28,37,28,17,4,27,6,72,11,104,84,125,6,72,67,1,52,72,38,125,61,8,8,81,112,13,101,19,122,30,23,121,121,46,82,84,91,26,105,0,115,22,29,107,6,48,29,86,48,89,57,72,24,83,3,7,39,29,67,17,83,36,28,3,15,28,121,23,125,46,5,29,72,169,127,82,120,13,37,27,15,28,11,2,7,29,7,13,30,38,25,22,4,22,31,2,85,6,105,78,65,29,10,26,8,34,67,19,66,32,9,97,5,104,4,97,14,19,75,78,22,28,65,4,4,80,72,74,108,65,29,8,67,36,24,75,122,112,12,23,26,72,66,29,51,10,20,125,100,74,103,32,1,0,22,8,14,21,3,18,33,2,67,16,4,65,101,36,89,94,4,17,16,6,68,34,120,123,88,10,23,45,120,83,14,94,23,95,85,78,11,16,15,65,73,181,188,88,12,7,23,0,15,1,82,80,53,4,25,69,125,9,33,13,6,1,8,28,6,83,122,65,17,75,31,95,25,49,56,17,38,77,23,27,65,13,29,16,86,57,123,21,90,62,12,2,82,112,89,1,10,64,80,0,1,7,56,29,32,23,10,82,40,34,19,27,26,28,67,10,112,3,64,11,5,10,36,19,110,100,27,26,72,76,27,6,124,223,103,2,101,1,23,27,13,89,91,11,27,10,1,23,1,8,102,80,6,13,106,27,85,124,26,225,14,76,91,4,69,112,4,4,72,91,25,44,67,15,7,95,13,12,5,107,123,80,56,112,92,66,101,31,13,0,23,95,18,106,10,82,36,65,11,59,63,29,57,30,10,76,135,4,10,3,13,67,104,3,60,101,82,18,1,79,29,118,17,54,16,152,9,6,19,67,83,104,4,20,39,22,102,36,25,110,112,103,15,13,10,16,28,9,93,31,23,11,4,38,7,0,18,11,4,28,22,80,15,56,36,22,82,125,98,33,27,24,89,72,102,15,79,26,26,65,28,39,23,15,4,115,72,11,27,72,146,23,22,122,8,102,121,27,126,89,13,28,98,6,91,123,76,29,29,26,121,95,65,6,17,27,66,22,67,5,1,76,32,13,125,28,44,17,6,48,4,107,25,22,4,18,23,26,3,79,82,78,22,4,33,8,122,194,21,66,77,41,29,28,26,14,7,28,13,102,84,121,4,29,75,123,21,41,21,6,0,36,2,91,210,92,16,5,55,61,21,53,26,61,8,72,24,7,29,10,103,72,79,31,56,21,2,70,25,95,220,79,88,24,49,28,19,6,24,14,13,16,68,1,45,83,13,123,26,56,31,107,7,19,21,8,1,76,66,30,23,84,24,16,52,79,121,21,39,7,23,36,48,6,10,10,26,21,0,104,29,2,15,8,28,20,84,2,20,190,84,13,23,13,1,16,36,120,18,52,1,30,121,6,13,77,102,72,15,30,25,68,31,11,36,82,65,3,115,13,104,76,15,30,101,27,6,6,13,71,89,31,20,89,11,115,82,0,65,22,89,77,6,13,25,44,87,56,23,30,73,36,95,8,73,123,21,196,28,26,73,10,28,11,67,101,23,123,89,17,5,10,16,58,106,76,1,39,98,89,13,28,13,19,0,10,25,75,69,47,31,24,65,84,72,21,106,4,65,21,2,30,1,36,27,78,95,15,23,29,23,9,62,72,28,16,79,15,72,14,115,110,251,22,15,46,7,29,122,0,6,91,44,104,6,61,24,17,13,4,89,89,95,8,0,1,5,122,28,67,104,44,34,22,48,53,116,57,125,83,12,97,5,70,104,24,31,29,79,125,104,23,1,17,122,38,61,122,15,10,10,105,95,4,22,79,0,92,0,36,89,22,91,25,39,50,22,7,79,7,23,79,125,247,29,39,28,6,59,21,28,123,69,102,5,5,54,29,25,95,27,69,27,14,78,121,19,23,49,78,67,13,29,27,27,34,5,7,29,53,6,1,5,29,111,100,31,27,65,8,16,36,98,115,67,85,68,39,0,31,19,14,100,101,120,123,23,2,35,1,27,88,0,65,9,6,10,28,26,75,22,5,39,8,72,80,28,16,20,79,49,78,69,98,48,79,112,28,7,50,36,13,106,84,29,12,15,68,39,4,66,0,26,89,102,30,15,29,22,81,29,65,31,16,97,19,6,90,28,73,11,14,6,93,80,18,17,14,13,5,100,32,27,108,26,65,67,1,90,85,15,16,83,0,31,16,29,11,92,89,27,26,15,10,21,7,24,28,79,104,36,24,31,6,122,67,125,11,102,11,14,112,3,18,16,3,10,20,90,93,17,104,8,27,12,55,9,4,95,126,27,1,25,88,14,112,17,1,13,73,101,91,25,80,1,21,21,58,10,13,7,10,67,2,57,28,122,16,90,81,103,125,7,79,18,0,67,16,15,66,4,1,6,24,65,25,6,6,72,104,23,120,104,0,38,50,45,4,120,91,94,3,49,79,2,82,23,20,2,112,89,77,4,28,22,85,9,28,17,82,21,18,123,17,87,15,78,79,5,13,31,15,26,18,6,41,88,40,80,27,12,25,39,89,29,26,123,14,28,8,36,76,89,67,14,42,10,122,84,13,103,88,6,14,22,74,86,91,3,32,100,22,1,73,4,68,73,4,54,9,21,85,78,29,103,6,70,28,60,18,19,24,89,23,20,12,162,91,6,33,13,69,38,13,50,72,72,2,19,58,21,11,14,31,98,60,7,28,56,31,94,103,31,1,6,26,13,121,11,15,16,96,4,121,23,86,29,72,21,67,115,16,84,79,12,72,72,29,123,18,0,27,16,72,29,23,79,12,82,73,71,37,82,29,18,85,4,24,16,73,24,12,126,9,13,64,147,0,81,0,0,95,123,26,16,14,97,95,102,28,23,27,80,49,7,4,122,123,125,3,4,36,82,29,8,2,28,102,28,95,30,73,112,30,93,13,124,5,122,6,9,18,9,89,104,106,9,15,4,28,1,125,0,0,7,48,7,60,2,27,64,22,55,36,85,67,21,10,17,60,32,56,36,59,28,24,11,48,15,26,21,107,4,18,26,75,93,14,15,75,50,3,13,70,76,124,4,10,90,36,26,69,22,97,22,75,28,23,123,74,5,48,91,17,22,39,33,67,26,22,1,3,10,104,43,67,2,6,107,86,67,23,95,22,7,100,21,75,12,84,94,66,121,1,89,73,25,7,12,12,13,31,13,34,28,36,17,74,104,26,86,11,17,1,6,124,24,21,90,104,45,79,24,23,72,23,83,80,22,20,72,5,57,0,7,31,124,8,10,13,28,80,26,79,83,9,28,68,2,78,9,104,16,29,71,14,90,7,76,1,0,21,49,92,122,72,31,12,153,2,30,16,7,5,121,95,72,23,52,105,14,29,22,37,39,9,77,44,77,13,29,34,0,8,14,29,104,5,3,4,91,21,10,47,80,64,98,121,10,7,56,89,22,11,2,31,31,135,28,74,51,107,73,18,48,86,82,60,24,6,8,0,23,126,74,47,16,54,27,17,107,3,80,0,11,90,34,21,17,85,12,50,81,30,89,53,20,122,15,22,0,69,17,36,2,26,0,28,0,2,123,65,13,94,19,84,127,61,6,27,4,91,11,121,19,68,26,0,83,72,77,72,28,10,7,13,85,11,3,234,15,2,75,16,101,15,10,85,93,0,68,65,19,85,100,55,0,5,25,25,112,19,0,0,17,89,21,107,12,89,7,13,0,4,115,94,65,67,74,17,29,20,15,8,13,17,4,1,17,21,68,122,94,19,121,93,6,34,74,43,79,10,31,29,31,60,103,12,123,78,135,90,29,4,111,65,13,15,62,123,67,17,65,72,15,29,65,3,16,19,29,18,1,12,1,1,74,104,76,65,28,35,36,91,84,124,73,6,67,91,15,82,8,22,7,73,94,18,29,28,92,56,120,0,24,68,60,116,22,33,117,28,73,83,10,14,10,22,97,8,75,72,13,94,90,0,13,6,16,14,5,91,72,101,12,98,121,4,19,69,25,106,42,22,0,70,9,31,27,105,98,23,7,23,60,123,81,121,1,67,21,8,10,126,4,72,122,11,28,9,1,89,28,97,24,68,123,4,18,25,70,1,10,9,1,0,121,79,100,122,18,2,68,62,95,14,82,103,77,91,11,23,24,91,9,82,23,47,73,100,13,123,20,72,0,123,16,145,4,10,123,95,89,6,21,30,6,69,79,72,1,27,103,10,67,17,84,28,49,15,0,0,102,7,121,64,232,16,86,33,5,67,22,4,29,66,40,100,121,65,67,11,244,89,89,27,1,106,90,20,40,25,18,67,11,0,53,73,32,55,65,29,121,36,23,72,5,0,74,16,4,104,50,10,21,2,17,3,51,2,125,23,24,72,27,88,83,27,23,25,35,122,84,7,24,80,11,31,6,9,107,30,28,51,21,9,24,78,28,17,79,106,75,10,16,107,1,78,34,67,19,107,22,24,19,75,30,1,32,13,6,0,54,21,84,7,16,103,1,23,14,13,13,10,32,66,16,7,10,28,72,14,41,14,25,15,14,28,13,62,45,82,16,36,77,112,0,123,16,1,138,80,15,36,103,15,22,9,6,65,7,73,0,84,83,10,16,53,18,24,39,14,28,83,7,121,0,19,26,29,36,10,4,16,93,84,6,25,89,4,6,16,5,65,70,82,28,87,56,7,11,16,28,13,23,58,6,23,5,10,29,74,78,39,122,5,14,65,107,127,17,83,67,85,10,5,10,81,18,85,29,28,28,51,93,11,43,75,2,23,2,61,123,15,23,19,28,66,10,16,72,22,0,14,27,16,10,41,81,26,22,27,94,9,65,14,19,10,4,17,7,4,78,124,2,72,15,82,4,107,12,44,112,1,12,13,94,10,73,22,29,26,68,125,26,17,46,21,23,2,6,82,70,17,103,29,23,123,7,13,48,67,65,65,35,65,22,7,15,82,28,4,72,0,28,67,253,41,7,19,12,73,29,1,71,123,23,2,23,40,65,73,122,23,32,29,0,4,9,26,23,58,6,31,85,1,90,9,25,21,22,50,7,6,6,0,23,10,12,3,39,78,28,21,27,23,31,26,123,4,103,15,83,5,12,2},key))if a then a()else print("WRONG PASSWORD!")end