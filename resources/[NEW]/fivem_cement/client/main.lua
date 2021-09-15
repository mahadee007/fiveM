ESX						= nil
local CurrentAction		= nil
local PlayerData		= {}
local pedIsTryingToLockpickVehicle  = false
local timer = 1 --in minutes - Set the time during the player is outlaw
local showOutlaw = true --Set if show outlaw act on map
local blipTime = 35 --in second
local showcopsmisbehave = true --show notification when cops steal too
local timing = timer * 60000 --Don't touche it
local cancel = false
local cachedBins = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

Citizen.CreateThread(function()
    Citizen.Wait(100)

    while true do
        local sleepThread = 1000

        local entity, entityDst = ESX.Game.GetClosestObject(Config.BinsAvailable)

        if DoesEntityExist(entity) and entityDst <= 1.5 then
            sleepThread = 5

            local binCoords = GetEntityCoords(entity)

            ESX.Game.Utils.DrawText3D(binCoords + vector3(0.0, 0.0, 0.5), "[~g~E~s~] Search Cement", 0.4)

            if IsControlJustReleased(0, 38) then
                if not cachedBins[entity] then
                    cachedBins[entity] = true

                    OpenTrashCan()
                else
                    ESX.ShowNotification("You've already searched this!")
                end
            end
        end

        Citizen.Wait(sleepThread)
    end
end)

function OpenTrashCan()
    
    Citizen.Wait(1000)
    Citizen.CreateThread(function()
        if chance == true then
            if Config.CallCops then
                local randomReport = math.random(1, Config.CallCopsPercent)
                print(Config.CallCopsPercent)
                if randomReport == Config.CallCopsPercent then
                    TriggerServerEvent('fivem_cement:Notify')
                end
            end
        else
        if Config.CallCops then
            local randomReport = math.random(1, Config.CallCopsPercent)
            print(Config.CallCopsPercent)
            if randomReport == Config.CallCopsPercent then
                TriggerServerEvent('fivem_cement:Notify')
            end
        end
    end
    end)

    Citizen.CreateThread(function()
        Citizen.Wait(0)

        if CurrentAction ~= nil then
            SetTextComponentFormat('STRING')
            AddTextComponentString(_U('abort_hint'))
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)

            if IsControlJustPressed(0, 178) then
                TerminateThread(ThreadID)
                ESX.ShowNotification(_U('aborted_lockpicking'))
                CurrentAction = nil
            end
        end
    end)
    TriggerEvent("mythic_progressbar:client:progress", {
        name = "Lockpicking",
        duration = 40000,
        label = "กำลังขโมยปูน",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
            anim = "machinic_loop_mechandplayer",
            flags = 49,
        },
    }, function(status)
        if not status then
            cancel = false
        else
            cancel = true
        end
    end)
    Citizen.Wait(40000)
    TriggerServerEvent('fivem_cement:pickedUp')

    ClearPedTasks(PlayerPedId())
end

--//////////////////////////////////////////////--
--                LOCKPICK CHANCE               --
--//////////////////////////////////////////////--
function lockpickchance()
	local nb = math.random(1, Config.percentage)
    percentage = Config.percentage
    if(nb < percentage)then
        return true
    else
        return false
    end
end
--//////////////////////////////////////////////--
--                LOCK VEHICLES                 --
--//////////////////////////////////////////////--
local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end
Citizen.CreateThread(function()
	while true do
		-- gets if player is entering vehicle
		if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId())) then
			-- gets vehicle player is trying to enter and its lock status
			local xPlayer = ESX.GetPlayerData()
			local veh = GetVehiclePedIsTryingToEnter(PlayerPedId())
			local lock = GetVehicleDoorLockStatus(veh)
				
				-- Get the conductor door angle, open if value > 0.0
				--local doorAngle = GetVehicleDoorAngleRatio(veh, 0)
			
				-- normalizes chance
				if Config.chance >= 100 then
					Config.chance = 100
				elseif Config.chance <= 0 then
					Config.chance = 0
				end
			
				-- check if got lucky
				local lucky = (math.random(100) < Config.chance)
			
				-- Set lucky if conductor door is open
				--[[ if doorAngle > 0.5 then
					lucky = true
				end ]]
			
				-- check if vehicle is in blacklist
				local blacklisted = false
				for k,model in pairs(Config.blacklist) do
					if IsVehicleModel(veh, GetHashKey(model)) then
						blacklisted = true
					end
				end

				-- gets ped that is driving the vehicle
				local pedd = GetPedInVehicleSeat(veh, -1)
				local plate = GetVehicleNumberPlateText(veh)
				-- lock doors if not lucky or blacklisted
				if ((lock == 7) or (pedd ~= 0 )) then
					if has_value(Config.job_whitelist, xPlayer.job.name) then
						TriggerServerEvent('fivem_cement:setVehicleDoorsForEveryone', {veh, 1, plate})
					else
						if not lucky or blacklisted then
							TriggerServerEvent('fivem_cement:setVehicleDoorsForEveryone', {veh, 2, plate})
						else
							TriggerServerEvent('fivem_cement:setVehicleDoorsForEveryone', {veh, 1, plate})
						end
					end
				end
			end
		Citizen.Wait(0)
	end
end)
RegisterNetEvent('fivem_cement:setVehicleDoors')
AddEventHandler('fivem_cement:setVehicleDoors', function(veh, doors)
	SetVehicleDoorsLocked(veh, doors)
end)
--//////////////////////////////////////////////--
--                 NOTIFICATION                 --
--//////////////////////////////////////////////--
GetPlayerName()

RegisterNetEvent('fivem_cement:outlawLockNotify')
AddEventHandler('fivem_cement:outlawLockNotify', function(alert)
	if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
		TriggerEvent('fivem_cement:notify2')
		PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
    end
end)

RegisterNetEvent("fivem_cement:notify2")
AddEventHandler("fivem_cement:notify2", function(msg, target)
	ESX.ShowAdvancedNotification(_U('911Call'), _U('911Lockpick'), _U('Lockcall'), 'CHAR_CALL911', 7)
end)
--//////////////////////////////////////////////--
--                   NETWORK                    --
--//////////////////////////////////////////////--
Citizen.CreateThread(function()
    while true do
        Wait(100)
        if NetworkIsSessionStarted() then
            DecorRegister("IsLockOutlaw",  3)
            DecorSetInt(GetPlayerPed(-1), "IsLockOutlaw", 1)
            return
        end
    end
end)
--//////////////////////////////////////////////--
--           SUSPECT DESCRITION                 --
--//////////////////////////////////////////////--
Citizen.CreateThread( function()
    while true do
        Wait(100)
        local plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
        local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
        local street1 = GetStreetNameFromHashKey(s1)
        local street2 = GetStreetNameFromHashKey(s2)
        if pedIsTryingToLockpickVehicle then
            DecorSetInt(GetPlayerPed(-1), "IsLockOutlaw", 2)
            if PlayerData.job ~= nil and PlayerData.job.name == 'police' and showcopsmisbehave == false then
            elseif PlayerData.job ~= nil and PlayerData.job.name == 'police' and showcopsmisbehave then
                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                    local sex = nil
                    if skin.sex == 0 then
                        sex = "male" --male/change it to your language
                    else
                        sex = "female" --female/change it to your language
                    end
                    TriggerServerEvent('fivem_cement:InProgressPos', plyPos.x, plyPos.y, plyPos.z)
                    if s2 == 0 then
                        TriggerServerEvent('fivem_cement:InProgressS1', street1, sex)
                    elseif s2 ~= 0 then
                        TriggerServerEvent('fivem_cement:InProgress', street1, street2, sex)
                    end
                end)
                Wait(3000)
                pedIsTryingToLockpickVehicle = false
            else
                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                    local sex = nil
                    if skin.sex == 0 then
                        sex = "male"
                    else
                        sex = "female"
                    end
                    TriggerServerEvent('fivem_cement:InProgressPos', plyPos.x, plyPos.y, plyPos.z)
                    if s2 == 0 then
                        TriggerServerEvent('fivem_cement:InProgressS1', street1, sex)
                    elseif s2 ~= 0 then
                        TriggerServerEvent('fivem_cement:InProgress', street1, street2, sex)
                    end
                end)
                Wait(3000)
                pedIsTryingToLockpickVehicle = false
            end
        end
    end
end)
--//////////////////////////////////////////////--
--              SUSPECT LOCATION                --
--//////////////////////////////////////////////--
RegisterNetEvent('fivem_cement:location')
AddEventHandler('fivem_cement:location', function(tx, ty, tz)
    if PlayerData.job.name == 'police' then
        local transT = 250
        local Blip = AddBlipForCoord(tx, ty, tz)
        SetBlipSprite(Blip,  10)
        SetBlipColour(Blip,  1)
        SetBlipAlpha(Blip,  transT)
        SetBlipAsShortRange(Blip,  false)
        while transT ~= 0 do
            Wait(blipTime * 4)
            transT = transT - 1
            SetBlipAlpha(Blip,  transT)
            if transT == 0 then
                SetBlipSprite(Blip,  2)
                return
            end
        end
    end
end)
--//////////////////////////////////////////////--
--               LOCKPICK CHECK                 --
--//////////////////////////////////////////////--
RegisterNetEvent('fivem_cement:Enable')
AddEventHandler('fivem_cement:Enable', function()
	pedIsTryingToLockpickVehicle = true
end)
