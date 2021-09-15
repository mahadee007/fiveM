ESX                           = nil
local PlayerData              = {}
Citizen.CreateThread(function()

	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

end)

RegisterNetEvent('e2eb5874-e217-4766-9351-a0c263282658')
AddEventHandler('e2eb5874-e217-4766-9351-a0c263282658', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('47a4973a-01b4-4000-9958-2981e347448f')
AddEventHandler('47a4973a-01b4-4000-9958-2981e347448f', function(job)
  PlayerData.job = job
end)

--Config
local timer = 1 --in minutes - Set the time during the player is outlaw
local showOutlaw = true --Set if show outlaw act on map
local gunshotAlert = true --Set if show alert when player use gun
local carJackingAlert = true --Set if show when player do carjacking
local meleeAlert = true --Set if show when player fight in melee
local blipGunTime = 10 --in second
local blipMeleeTime = 15 --in second
local blipJackingTime = 20 -- in second
local showcopsmisbehave = true  --show notification when cops steal too
--End config

local timing = timer * 60000 --Don't touche it

GetPlayerName()
RegisterNetEvent('2c5067c9-1421-48af-b027-5c8dd4ca4e5b')
AddEventHandler('2c5067c9-1421-48af-b027-5c8dd4ca4e5b', function(alert)
		if PlayerData.job ~= nil and PlayerData.job.name == 'police' or PlayerData.job ~= nil and PlayerData.job.name == 'fbi' then
            Notify(alert)
        end
end)

function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if NetworkIsSessionStarted() then
            DecorRegister("IsOutlaw",  3)
            DecorSetInt(GetPlayerPed(-1), "IsOutlaw", 1)
            return
        end
    end
end)

RegisterNetEvent('6b8bbfee-61de-4d54-82bf-9195c29a371a')
AddEventHandler('6b8bbfee-61de-4d54-82bf-9195c29a371a', function(tx, ty, tz)
	if PlayerData.job ~= nil and PlayerData.job.name == 'police' or PlayerData.job ~= nil and PlayerData.job.name == 'fbi' then
		if carJackingAlert then
			local transT = 250
			local thiefBlip = AddBlipForCoord(tx, ty, tz)
			SetBlipSprite(thiefBlip,  10)
			SetBlipColour(thiefBlip,  1)
			SetBlipAlpha(thiefBlip,  transT)
			SetBlipAsShortRange(thiefBlip,  1)
			while transT ~= 0 do
				Wait(blipJackingTime * 4)
				transT = transT - 1
				SetBlipAlpha(thiefBlip,  transT)
				if transT == 0 then
					SetBlipSprite(thiefBlip,  2)
					return
				end
			end
			
		end
	end
end)

RegisterNetEvent('eddd8ae6-be00-4048-b8ad-7b8b402e5aff')
AddEventHandler('eddd8ae6-be00-4048-b8ad-7b8b402e5aff', function(gx, gy, gz)
	if PlayerData.job ~= nil and PlayerData.job.name == 'police' or PlayerData.job ~= nil and PlayerData.job.name == 'fbi' then
		if gunshotAlert then
			local transG = 250
			local gunshotBlip = AddBlipForCoord(gx, gy, gz)
			SetBlipSprite(gunshotBlip,  1)
			SetBlipColour(gunshotBlip,  1)
			SetBlipAlpha(gunshotBlip,  transG)
			SetBlipAsShortRange(gunshotBlip,  1)
			while transG ~= 0 do
				Wait(blipGunTime * 4)
				transG = transG - 1
				SetBlipAlpha(gunshotBlip,  transG)
				if transG == 0 then
					SetBlipSprite(gunshotBlip,  2)
					return
				end
			end
		   
		end
	end
end)

-- RegisterNetEvent('da521761-ce52-4301-be0d-045d9e14c070')
-- AddEventHandler('da521761-ce52-4301-be0d-045d9e14c070', function(mx, my, mz)
	-- if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
		-- if meleeAlert then
			-- local transM = 250
			-- local meleeBlip = AddBlipForCoord(mx, my, mz)
			-- SetBlipSprite(meleeBlip,  270)
			-- SetBlipColour(meleeBlip,  17)
			-- SetBlipAlpha(meleeBlip,  transG)
			-- SetBlipAsShortRange(meleeBlip,  1)
			-- while transM ~= 0 do
				-- Wait(blipMeleeTime * 4)
				-- transM = transM - 1
				-- SetBlipAlpha(meleeBlip,  transM)
				-- if transM == 0 then
					-- SetBlipSprite(meleeBlip,  2)
					-- return
				-- end
			-- end
			
		-- end
	-- end
-- end)

--Star color
--[[1- White
2- Black
3- Grey
4- Clear grey
5-
6-
7- Clear orange
8-
9-
10-
11-
12- Clear blue]]

-- Citizen.CreateThread( function()
    -- while true do
        -- Wait(0)
        -- if showOutlaw then
            -- for i = 0, 31 do
				-- if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
					-- if DecorGetInt(GetPlayerPed(i), "IsOutlaw") == 2 and GetPlayerPed(i) ~= GetPlayerPed(-1) then
						-- gamerTagId = Citizen.InvokeNative(0xBFEFE3321A3F5015, GetPlayerPed(i), ".", false, false, "", 0 )
						-- Citizen.InvokeNative(0xCF228E2AA03099C3, gamerTagId, 0) --Show a star
						-- Citizen.InvokeNative(0x63BB75ABEDC1F6A0, gamerTagId, 7, true) --Active gamerTagId
						-- Citizen.InvokeNative(0x613ED644950626AE, gamerTagId, 7, 1) --White star
					-- elseif DecorGetInt(GetPlayerPed(i), "IsOutlaw") == 1 then
						-- Citizen.InvokeNative(0x613ED644950626AE, gamerTagId, 7, 255) -- Set Color to 255
						-- Citizen.InvokeNative(0x63BB75ABEDC1F6A0, gamerTagId, 7, false) --Unactive gamerTagId
					-- end
				-- end
            -- end
        -- end
    -- end
-- end)

Citizen.CreateThread( function()
    while true do
        Wait(0)
        if DecorGetInt(GetPlayerPed(-1), "IsOutlaw") == 2 then
            Wait( math.ceil(timing) )
            DecorSetInt(GetPlayerPed(-1), "IsOutlaw", 1)
        end
    end
end)

Citizen.CreateThread( function()
    while true do
        Wait(0)
        local plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
        local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
        local street1 = GetStreetNameFromHashKey(s1)
        local street2 = GetStreetNameFromHashKey(s2)
        if IsPedTryingToEnterALockedVehicle(GetPlayerPed(-1)) or IsPedJacking(GetPlayerPed(-1)) then
			TriggerServerEvent('8addbf09-fcf4-4062-872b-3cb88a98823c', "carjacking!")
			Wait(3000)
			DecorSetInt(GetPlayerPed(-1), "IsOutlaw", 2)
			local playerPed = GetPlayerPed(-1)
			local coords    = GetEntityCoords(playerPed)
			local vehicle =GetVehiclePedIsIn(playerPed,false)
			local vehicleProps  = ESX.Game.GetVehicleProperties(vehicle)
			if PlayerData.job ~= nil and PlayerData.job.name == 'police' and showcopsmisbehave == false or PlayerData.job ~= nil and PlayerData.job.name == 'fbi' and showcopsmisbehave == false then
			elseif PlayerData.job ~= nil and PlayerData.job.name == 'police' and showcopsmisbehave or PlayerData.job ~= nil and PlayerData.job.name == 'fbi' and showcopsmisbehave then
				ESX.TriggerServerCallback('006e796e-a274-4116-a5d6-835f580e1922',function(valid)
					if (valid) then
					else
						ESX.TriggerServerCallback('fa50ae78-67f7-4539-8dd9-132c3d080117', function(skin, jobSkin)
							local sex = nil
							if skin.sex == 0 then
								sex = "a guy"
							else
								sex = "a girl"
							end
							TriggerServerEvent('9d69cd7e-a9b6-48d7-a36e-62ce890481ed', plyPos.x, plyPos.y, plyPos.z)
							local veh = GetVehiclePedIsTryingToEnter(GetPlayerPed(-1))
							local vehName = GetDisplayNameFromVehicleModel(GetEntityModel(veh))
							local vehName2 = GetLabelText(vehName)
							if s2 == 0 then
								if IsPedInAnyPoliceVehicle(GetPlayerPed(-1)) then
									TriggerServerEvent('thiefInProgressS1police', street1, vehName2, sex)
								else
									TriggerServerEvent('22e853fe-33a0-43a6-96f7-d61c93e8eb10', street1, vehName2, sex)
								end
							elseif s2 ~= 0 then
								if IsPedInAnyPoliceVehicle(GetPlayerPed(-1)) then
									TriggerServerEvent('8f17ce0e-dd9e-4a01-82ab-52a5ef950b4b', street1, street2, vehName2, sex)
								else
									TriggerServerEvent('e948c5d1-d411-4f00-8463-a3cf196725e7', street1, street2, vehName2, sex)
								end
							end
						end)
					end
				end,vehicleProps)
			else
				ESX.TriggerServerCallback('006e796e-a274-4116-a5d6-835f580e1922',function(valid)
					if (valid) then
					else
						ESX.TriggerServerCallback('fa50ae78-67f7-4539-8dd9-132c3d080117', function(skin, jobSkin)
							local sex = nil
							if skin.sex == 0 then
								sex = "a guy"
							else
								sex = "a girl"
							end
							TriggerServerEvent('9d69cd7e-a9b6-48d7-a36e-62ce890481ed', plyPos.x, plyPos.y, plyPos.z)
							local veh = GetVehiclePedIsTryingToEnter(GetPlayerPed(-1))
							local vehName = GetDisplayNameFromVehicleModel(GetEntityModel(veh))
							local vehName2 = GetLabelText(vehName)
							if s2 == 0 then
								TriggerServerEvent('22e853fe-33a0-43a6-96f7-d61c93e8eb10', street1, vehName2, sex)
							elseif s2 ~= 0 then
								TriggerServerEvent('e948c5d1-d411-4f00-8463-a3cf196725e7', street1, street2, vehName2, sex)
							end
						end)
					end
				end,vehicleProps)
			end
        end
    end
end)


-- Citizen.CreateThread( function()
    -- while true do
        -- Wait(0)
        -- local plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
        -- local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
        -- local street1 = GetStreetNameFromHashKey(s1)
        -- local street2 = GetStreetNameFromHashKey(s2)
        -- if IsPedInMeleeCombat(GetPlayerPed(-1)) then
            -- DecorSetInt(GetPlayerPed(-1), "IsOutlaw", 2)
			-- if PlayerData.job ~= nil and PlayerData.job.name == 'police' and showcopsmisbehave == false then
			-- elseif PlayerData.job ~= nil and PlayerData.job.name == 'police' and showcopsmisbehave then
				-- ESX.TriggerServerCallback('fa50ae78-67f7-4539-8dd9-132c3d080117', function(skin, jobSkin)
					-- local sex = nil
					-- if skin.sex == 0 then
						-- sex = "a guy"
					-- else
						-- sex = "a girl"
					-- end
					-- TriggerServerEvent('0f3a721d-9e35-4303-a4ac-35d41372434c', plyPos.x, plyPos.y, plyPos.z)
					-- if s2 == 0 then
						-- TriggerServerEvent('41fdc461-ca26-4c63-a105-222dfd75130c', street1, sex)
					-- elseif s2 ~= 0 then
						-- TriggerServerEvent('56df97f0-1eb4-4be1-b1fb-c95d897f3239', street1, street2, sex)
					-- end
				-- end)
				-- Wait(3000)
			-- else
				-- ESX.TriggerServerCallback('fa50ae78-67f7-4539-8dd9-132c3d080117', function(skin, jobSkin)
					-- local sex = nil
					-- if skin.sex == 0 then
						-- sex = "a guy"
					-- else
						-- sex = "a girl"
					-- end
					-- TriggerServerEvent('0f3a721d-9e35-4303-a4ac-35d41372434c', plyPos.x, plyPos.y, plyPos.z)
					-- if s2 == 0 then
						-- TriggerServerEvent('41fdc461-ca26-4c63-a105-222dfd75130c', street1, sex)
					-- elseif s2 ~= 0 then
						-- TriggerServerEvent('56df97f0-1eb4-4be1-b1fb-c95d897f3239', street1, street2, sex)
					-- end
				-- end)
				-- Wait(3000)
			-- end
        -- end
    -- end
-- end)

Citizen.CreateThread( function()
    while true do
        Wait(0)
        local plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
        local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
        local street1 = GetStreetNameFromHashKey(s1)
        local street2 = GetStreetNameFromHashKey(s2)
        if IsPedShooting(GetPlayerPed(-1)) then
            DecorSetInt(GetPlayerPed(-1), "IsOutlaw", 2)
			if PlayerData.job ~= nil and PlayerData.job.name == 'police' and showcopsmisbehave == false or PlayerData.job ~= nil and PlayerData.job.name == 'fbi' and showcopsmisbehave == false then
			elseif PlayerData.job ~= nil and PlayerData.job.name == 'police' and showcopsmisbehave or PlayerData.job ~= nil and PlayerData.job.name == 'fbi' and showcopsmisbehave then
				ESX.TriggerServerCallback('fa50ae78-67f7-4539-8dd9-132c3d080117', function(skin, jobSkin)
					local sex = nil
					if skin.sex == 0 then
						sex = "a guy"
					else
						sex = "a girl"
					end
					TriggerServerEvent('1931b20e-a4bb-4676-bd25-3e71fa42b497', plyPos.x, plyPos.y, plyPos.z)
					if s2 == 0 then
						TriggerServerEvent('30502300-a00d-4e48-94a9-8e8358aeae8d', street1, sex)
					elseif s2 ~= 0 then
						TriggerServerEvent('d0b666c7-9e6c-4cac-bc60-b3ed34882cbe', street1, street2, sex)
					end
				end)
				Wait(3000)
			else
				ESX.TriggerServerCallback('fa50ae78-67f7-4539-8dd9-132c3d080117', function(skin, jobSkin)
					local sex = nil
					if skin.sex == 0 then
						sex = "a guy"
					else
						sex = "a girl"
					end
					TriggerServerEvent('1931b20e-a4bb-4676-bd25-3e71fa42b497', plyPos.x, plyPos.y, plyPos.z)
					if s2 == 0 then
						TriggerServerEvent('30502300-a00d-4e48-94a9-8e8358aeae8d', street1, sex)
					elseif s2 ~= 0 then
						TriggerServerEvent('d0b666c7-9e6c-4cac-bc60-b3ed34882cbe', street1, street2, sex)
					end
				end)
				Wait(3000)
			end
        end
    end
end)