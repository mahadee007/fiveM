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

isInInventory = false
ESX = nil
local poid		 = 0
local Accessory_Items = {}

RegisterNetEvent("esx_inventoryhud:getOwnerAccessories")
AddEventHandler("esx_inventoryhud:getOwnerAccessories",function()
    TriggerServerEvent("esx_inventoryhud:getOwnerAccessories")
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    TriggerServerEvent("esx_inventoryhud:getOwnerAccessories")
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
        TriggerServerEvent("esx_inventoryhud:getOwnerAccessories")
	end
end)

RegisterNetEvent("esx_inventoryhud:setOwnerAccessories")
AddEventHandler("esx_inventoryhud:setOwnerAccessories", function(result)
    Accessory_Items = result
end)

RegisterNetEvent('esx_inventoryhud:RadialMenu')
AddEventHandler('esx_inventoryhud:RadialMenu', function()
    openInventory()
end)

RegisterNetEvent("esx_inventoryhud:change")
AddEventHandler("esx_inventoryhud:change", function(tpoid)
	poid = tpoid
end)

Citizen.CreateThread(
    function()
        while ESX == nil do
            TriggerEvent(
                "esx:getSharedObject",
                function(obj)
                    ESX = obj
                end
            )
            Citizen.Wait(0)
        end
		SetNuiFocus(false,false)
    end
)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(250)
        SendNUIMessage({
            show = IsPauseMenuActive(),
			inventory = poid / 1000
        })
    end
end)

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            if IsControlJustReleased(0, Config.OpenControl) and IsInputDisabled(0) then
                local dura = 500
                Wait(dura)
                openInventory()
            end
        end
    end
)

function openInventory()
    loadPlayerInventory()
    isInInventory = true
    SendNUIMessage(
        {
            action = "display",
            type = "normal"
        }
    )
    SetNuiFocus(true, true)
end

function closeInventory()
    isInInventory = false
    SendNUIMessage(
        {
            action = "hide"
        }
    )
    SetNuiFocus(false, false)
end

RegisterNUICallback(
    "NUIFocusOff",
    function()
        closeInventory()
    end
)

RegisterNUICallback(
    "GetNearPlayers",
    function(data, cb)
        local playerPed = PlayerPedId()
        local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
        local foundPlayers = false
        local elements = {}

        for i = 1, #players, 1 do
            if players[i] ~= PlayerId() then
                foundPlayers = true

                table.insert(
                    elements,
                    {
                        --label = GetPlayerName(players[i]),
                        player = GetPlayerServerId(players[i])
                    }
                )
            end
        end

        if not foundPlayers then
            exports.pNotify:SendNotification(
                {
                    text = _U("players_nearby"),
                    type = "error",
                    timeout = 3000,
                    layout = "bottomCenter",
                    queue = "inventoryhud"
                }
            )
        else
            SendNUIMessage(
                {
                    action = "nearPlayers",
                    foundAny = foundPlayers,
                    players = elements,
                    item = data.item
                }
            )
        end

        cb("ok")
    end
)

RegisterNUICallback(
    "UseItem",
    function(data, cb)
    
	
		if string.find(data.item.type, "car_key_") then
			local plate = string.gsub(data.item.type, "car_key_", "")
			TriggerEvent("scotty:keyTrigger", plate)
			return
		elseif data.item.type == "item_accessories" then
            local player = GetPlayerPed(-1)

            closeInventory()
           
            if data.item.name == "helmet" then
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if skin["helmet_1"] == -1 then

                        local dict = "veh@bicycle@roadfront@base"
                        local anim = "put_on_helmet"
            
                        RequestAnimDict(dict)
                        while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                        
                        TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
            
                        Wait(1000)

                        local accessorySkin = {}
                        accessorySkin['helmet_1'] = data.item.itemnum
                        accessorySkin['helmet_2'] = data.item.itemskin

                        TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
                    else

                         if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                            local dict = "veh@bike@common@front@base"
                            local anim = "take_off_helmet_walk"

                            RequestAnimDict(dict)
                            while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                            
                            TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
                
                            Wait(800)
                        end

                        local accessorySkin = {}
                        accessorySkin['helmet_1'] = -1
                        accessorySkin['helmet_2'] = 0
                        TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
                    end
                    
                end)
            elseif data.item.name == "mask" then
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if skin["mask_1"] == -1 then

                        local dict = "veh@bicycle@roadfront@base"
                        local anim = "put_on_helmet"
            
                        RequestAnimDict(dict)
                        while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                        
                        TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
            
                        Wait(1000)

                        local accessorySkin = {}
                        accessorySkin['mask_1'] = data.item.itemnum
                        accessorySkin['mask_2'] = data.item.itemskin
                        TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
                    else

                        if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                            local dict = "veh@bike@common@front@base"
                            local anim = "take_off_helmet_walk"

                            RequestAnimDict(dict)
                            while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                            
                            TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
                
                            Wait(800)
                        end

                        local accessorySkin = {}
                        accessorySkin['mask_1'] = -1
                        accessorySkin['mask_2'] = 0
                        TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
                    end
                    
                end)
            elseif data.item.name == "glasses" then
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if skin["glasses_1"] == -1 then

                        if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                            local dict = "clothingspecs"
                            local anim = "try_glasses_positive_a"
                
                            RequestAnimDict(dict)
                            while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                            
                            TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
                
                            Wait(800)
                        end

                        local accessorySkin = {}
                        accessorySkin['glasses_1'] = data.item.itemnum
                        accessorySkin['glasses_2'] = data.item.itemskin
                        TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)

                    else

                        if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                            local dict = "clothingspecs"
                            local anim = "take_off"
                
                            RequestAnimDict(dict)
                            while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                            
                            TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
                
                            Wait(1000)
                        end

                        local accessorySkin = {}
                        accessorySkin['glasses_1'] = -1
                        accessorySkin['glasses_2'] = 0
                        TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
                    end
                    
                end)
--------------------------------------------------------------------------------------------------------   ****
             elseif data.item.name == "torso" then
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if skin["torso_1"] == -1 then

                        if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                            local dict = "mp_safehouseshower@male@"
                            local anim = "male_shower_towel_dry_to_get_dressed"  
                
                            RequestAnimDict(dict)
                            while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                            
                            TaskPlayAnim(player, dict, anim, 8.0, 1.0, -1, 0, 0.5, 0, 0 )
                
                            Wait(800)
                        end

                        local accessorySkin = {}
                        accessorySkin['torso_1'] = data.item.itemnum
                        accessorySkin['torso_2'] = data.item.itemskin
                        TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)

                    else

                        if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                            local dict = "mp_safehouseshower@male@"
                            local anim = "male_shower_undress_&_turn_on_water"
                
                            RequestAnimDict(dict)
                            while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                            
                            TaskPlayAnim(player, dict, anim, 8.0, 1.0, -1, 0, 0.3, 0, 0 )
                
                            Wait(800)
                        end

                        local accessorySkin = {}
                        accessorySkin['torso_1'] = -1
                        accessorySkin['torso_2'] = 0
                        TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
                    end
                    
                end)
             elseif data.item.name == "pants" then
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if skin["pants_1"] == -1 then

                        if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                            local dict = "mp_safehouseshower@male@"
                            local anim = "male_shower_towel_dry_to_get_dressed"  
                
                            RequestAnimDict(dict)
                            while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                            
                            TaskPlayAnim(player, dict, anim, 8.0, 1.0, -1, 0, 0.5, 0, 0 )
                
                            Wait(800)
                        end

                        local accessorySkin = {}
                        accessorySkin['pants_1'] = data.item.itemnum
                        accessorySkin['pants_2'] = data.item.itemskin
                        TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)

                    else

                        if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                            local dict = "mp_safehouseshower@male@"
                            local anim = "male_shower_undress_&_turn_on_water"
                
                            RequestAnimDict(dict)
                            while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                            
                            TaskPlayAnim(player, dict, anim, 8.0, 1.0, -1, 0, 0.3, 0, 0 )
                
                            Wait(800)
                        end

                        local accessorySkin = {}
                        accessorySkin['pants_1'] = -1
                        accessorySkin['pants_2'] = 0
                        TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
                    end
                    
                end)
            elseif data.item.name == "earring" then
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if skin["ears_1"] == -1 then

                        if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                            local dict = "mini@ears_defenders"
                            local anim = "takeoff_earsdefenders_idle"
                
                            RequestAnimDict(dict)
                            while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                            
                            TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
                
                            Wait(800)
                        end

                        local accessorySkin = {}
                        accessorySkin['ears_1'] = data.item.itemnum
                        accessorySkin['ears_2'] = data.item.itemskin
                        TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
                    else

                        if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                            local dict = "mini@ears_defenders"
                            local anim = "takeoff_earsdefenders_idle"
                
                            RequestAnimDict(dict)
                            while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                            
                            TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
                
                            Wait(800)
                        end

                        local accessorySkin = {}
                        accessorySkin['ears_1'] = -1
                        accessorySkin['ears_2'] = 0
                        TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
                    end
                    
                end)
            end
        elseif data.item.name == 'id_card' then
            TriggerEvent('teamDvm_idcard:id_card', source)
            closeInventory()
        elseif data.item.name == 'driver_license' then
            TriggerEvent('teamDvm_idcard:dv_license', source)
            closeInventory()
        else
            TriggerServerEvent("esx:useItem", data.item.name)
            if ItemCloseInventory(data.item.name) then
            --Citizen.Wait(500)
                closeInventory()
            else
                Citizen.Wait(500)
                loadPlayerInventory()
            end
        end

        cb("ok")
    end
)

function ItemCloseInventory(item)
    for k, v in ipairs(Config.ItemClose) do 
        if v == item then
            return true
        end
    end

    return false
end

RegisterNUICallback(
    "DropItem",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end
		
		if data.item.name == "idcard"
		or data.item.name == "driverid"
		or data.item.name == "weaponid" then
			return
		end
		
		if Config.disableDrop and Config.disableDrop[data.item.name] then
			exports.pNotify:SendNotification(
                {
                    text = "ไม่สามารถทิ้งของชิ้นนี้ได้",
                    type = "error",
                    timeout = 3000,
                    layout = "bottomCenter",
                    queue = "inventoryhud"
                }
            )
			return
		end

		local lPed = GetPlayerPed(-1)
        if string.find(data.item.type, "car_key_") then
			if not IsPedInAnyVehicle(lPed, false) and IsPedOnFoot(lPed) and not IsPedUsingAnyScenario(lPed) then
				local playerPed = PlayerPedId()
			

				closeInventory()
				Wait(7000)
			end
		elseif type(data.number) == "number" and math.floor(data.number) == data.number then
			if not IsPedInAnyVehicle(lPed, false) and IsPedOnFoot(lPed) and not IsPedUsingAnyScenario(lPed) then
				local playerPed = PlayerPedId()
				TriggerServerEvent("esx:removeInventoryItem", data.item.type, data.item.name, data.number)
				closeInventory()
				Wait(2000)
			end
        end

        Wait(250)
        loadPlayerInventory()

        cb("ok")
    end
)

local carkeys AddEventHandler('scotty:globalFetchCarKeys', function(keys) carkeys = keys end)
RegisterNUICallback(
    "GiveItem",
    function(data, cb)
		if Config.disableGive and Config.disableGive[data.item.name] then
			exports.pNotify:SendNotification(
                {
                    text = "ไม่สามารถให้ของชิ้นนี้ได้",
                    type = "error",
                    timeout = 3000,
                    layout = "bottomCenter",
                    queue = "inventoryhud"
                }
            )
			return
		end
		
        local playerPed = PlayerPedId()
        local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
        local foundPlayer = false
        for i = 1, #players, 1 do
            if players[i] ~= PlayerId() then
                if GetPlayerServerId(players[i]) == data.player then
                    foundPlayer = true
                end
            end
        end

        if foundPlayer then
            local count = tonumber(data.number)

            if data.item.type == "item_weapon" then
                count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
            end
			
			local lPed = GetPlayerPed(-1)
			if not IsPedInAnyVehicle(lPed, false) and IsPedOnFoot(lPed) and not IsPedUsingAnyScenario(lPed) and string.find(data.item.type, "car_key_") then
				local plate = string.gsub(data.item.type, "car_key_", "")
				TriggerServerEvent("scotty:giveCarKey", data.player, plate)
				
				Wait(500)
				loadPlayerInventory()
				return
			end
			
			if not IsPedInAnyVehicle(lPed, false) and IsPedOnFoot(lPed) and not IsPedUsingAnyScenario(lPed) then
				if data.item.name == "idcard" then
					TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), data.player)
					
					exports.pNotify:SendNotification(
						{
							text = "คุณได้โชว์บัตรประชาชนให้แก่ "..data.player,
							type = "error",
							timeout = 3000,
							layout = "bottomCenter",
							queue = "inventoryhud"
						}
					)
				elseif data.item.name == "driveid" then
					TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), data.player, 'driver')
					exports.pNotify:SendNotification(
						{
							text = "คุณได้โชว์ใบขับขี่ให้แก่ "..data.player,
							type = "error",
							timeout = 3000,
							layout = "bottomCenter",
							queue = "inventoryhud"
						}
					)
				elseif data.item.name == "weaponid" then
					TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), data.player, 'weapon')
					exports.pNotify:SendNotification(
						{
							text = "คุณได้โชว์ใบพกพาอาวุธให้แก่ "..data.player,
							type = "error",
							timeout = 3000,
							layout = "bottomCenter",
							queue = "inventoryhud"
						}
					)
				else
					TriggerServerEvent("esx:giveInventoryItem", data.player, data.item.type, data.item.name, count)
				end
				Wait(250)
				loadPlayerInventory()
			end
        else
            exports.pNotify:SendNotification(
                {
                    text = _U("player_nearby"),
                    type = "error",
                    timeout = 3000,
                    layout = "bottomCenter",
                    queue = "inventoryhud"
                }
            )
        end
        cb("ok")
    end
)

RegisterNUICallback(
    "UseMask",
    function(data, cb)

        if data.item.type == "item_accessories" then
            local player = GetPlayerPed(-1)

            closeInventory()
           
            if data.item.name == "helmet" then
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if skin["helmet_1"] == -1 then

                        local dict = "veh@bicycle@roadfront@base"
                        local anim = "put_on_helmet"
            
                        RequestAnimDict(dict)
                        while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                        
                        TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
            
                        Wait(1000)

                        local accessorySkin = {}
                        accessorySkin['helmet_1'] = data.item.itemnum
                        accessorySkin['helmet_2'] = data.item.itemskin

                        TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
                    else

                         if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                            local dict = "veh@bike@common@front@base"
                            local anim = "take_off_helmet_walk"

                            RequestAnimDict(dict)
                            while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                            
                            TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
                
                            Wait(800)
                        end

                        local accessorySkin = {}
                        accessorySkin['helmet_1'] = -1
                        accessorySkin['helmet_2'] = 0
                        TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
                    end
                    
                end)
            elseif data.item.name == "mask" then
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if skin["mask_1"] == -1 then

                        local dict = "veh@bicycle@roadfront@base"
                        local anim = "put_on_helmet"
            
                        RequestAnimDict(dict)
                        while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                        
                        TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
            
                        Wait(1000)

                        local accessorySkin = {}
                        accessorySkin['mask_1'] = data.item.itemnum
                        accessorySkin['mask_2'] = data.item.itemskin
                        TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
                    else

                        if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                            local dict = "veh@bike@common@front@base"
                            local anim = "take_off_helmet_walk"

                            RequestAnimDict(dict)
                            while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                            
                            TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
                
                            Wait(800)
                        end

                        local accessorySkin = {}
                        accessorySkin['mask_1'] = -1
                        accessorySkin['mask_2'] = 0
                        TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
                    end
                    
                end)
            elseif data.item.name == "glasses" then
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if skin["glasses_1"] == -1 then

                        if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                            local dict = "clothingspecs"
                            local anim = "try_glasses_positive_a"
                
                            RequestAnimDict(dict)
                            while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                            
                            TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
                
                            Wait(800)
                        end

                        local accessorySkin = {}
                        accessorySkin['glasses_1'] = data.item.itemnum
                        accessorySkin['glasses_2'] = data.item.itemskin
                        TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)

                        ClearPedTasks(player)
                    else

                        if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                            local dict = "clothingspecs"
                            local anim = "take_off"
                
                            RequestAnimDict(dict)
                            while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                            
                            TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
                
                            Wait(1000)
                        end

                        local accessorySkin = {}
                        accessorySkin['glasses_1'] = -1
                        accessorySkin['glasses_2'] = 0
                        TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
                    end
                    
                end)
            elseif data.item.name == "torso" then
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if skin["torso_1"] == -1 then

                        if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                            local dict = "mp_safehouseshower@male@"
                            local anim = "male_shower_undress_&_turn_on_water"
                
                            RequestAnimDict(dict)
                            while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                            
                            TaskPlayAnim(player, dict, anim, 8.0, 1.0, -1, 0, 0.3, 0, 0 )
                
                            Wait(800)
                        end

                        local accessorySkin = {}
                        accessorySkin['torso_1'] = data.item.itemnum
                        accessorySkin['torso_2'] = data.item.itemskin
                        TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)

                        ClearPedTasks(player)
                    else

                        if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                            local dict = "mp_safehouseshower@male@"
                            local anim = "male_shower_undress_&_turn_on_water"
                
                            RequestAnimDict(dict)
                            while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                            
                            TaskPlayAnim(player, dict, anim, 8.0, 1.0, -1, 0, 0.3, 0, 0 )
                
                            Wait(800)
                        end

                        local accessorySkin = {}
                        accessorySkin['torso_1'] = -1
                        accessorySkin['torso_2'] = 0
                        TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
                    end
                    
                end)
            elseif data.item.name == "pants" then
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if skin["pants_1"] == -1 then

                        if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                            local dict = "mp_safehouseshower@male@"
                            local anim = "male_shower_undress_&_turn_on_water"
                
                            RequestAnimDict(dict)
                            while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                            
                            TaskPlayAnim(player, dict, anim, 8.0, 1.0, -1, 0, 0.3, 0, 0 )
                
                            Wait(800)
                        end

                        local accessorySkin = {}
                        accessorySkin['pants_1'] = data.item.itemnum
                        accessorySkin['pants_2'] = data.item.itemskin
                        TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)

                        ClearPedTasks(player)
                    else

                        if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                            local dict = "mp_safehouseshower@male@"
                            local anim = "male_shower_undress_&_turn_on_water"
                
                            RequestAnimDict(dict)
                            while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                            
                            TaskPlayAnim(player, dict, anim, 8.0, 1.0, -1, 0, 0.3, 0, 0 )
                
                            Wait(800)
                        end

                        local accessorySkin = {}
                        accessorySkin['pants_1'] = -1
                        accessorySkin['pants_2'] = 0
                        TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
                    end
                    
                end)
            elseif data.item.name == "earring" then
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if skin["ears_1"] == -1 then

                        if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                            local dict = "mini@ears_defenders"
                            local anim = "takeoff_earsdefenders_idle"
                
                            RequestAnimDict(dict)
                            while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                            
                            TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
                
                            Wait(800)
                        end

                        local accessorySkin = {}
                        accessorySkin['ears_1'] = data.item.itemnum
                        accessorySkin['ears_2'] = data.item.itemskin
                        TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
                    else

                        if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                            local dict = "mini@ears_defenders"
                            local anim = "takeoff_earsdefenders_idle"
                
                            RequestAnimDict(dict)
                            while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                            
                            TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
                
                            Wait(800)
                        end

                        local accessorySkin = {}
                        accessorySkin['ears_1'] = -1
                        accessorySkin['ears_2'] = 0
                        TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
                    end
                    
                end)
            end
        end
    end
)

function shouldCloseInventory(itemName)
    for index, value in ipairs(Config.CloseUiItems) do
        if value == itemName then
            return true
        end
    end

    return false
end

function shouldSkipAccount(accountName)
    for index, value in ipairs(Config.ExcludeAccountsList) do
        if value == accountName then
            return true
        end
    end

    return false
end

function loadPlayerInventory()
    ESX.TriggerServerCallback(
        "esx_inventoryhud:getPlayerInventory",
        function(data)
            items = {}
            inventory = data.inventory
            accounts = data.accounts
            money = data.money
            weapons = data.weapons
            if Config.Items then
                itemData = {
                    label ="บัตรประชาชน",
                    name = "id_card",
                    type = "item_account",
                    count = 1,
                    limit = 1,
                    usable = true,
                    rare = false,
                    canRemove = false
                }

                table.insert(items, itemData)
            end

            if Config.Items then
                itemData = {
                    label ="ใบขับขี่",
                    name = "driver_license",
                    type = "item_account",
                    count = 1,
                    limit = 1,
                    usable = true,
                    rare = false,
                    canRemove = false
                }

                table.insert(items, itemData)
            end
            if Config.IncludeCash and money ~= nil and money > 0 then
                moneyData = {
                    label = _U("cash"),
                    name = "cash",
                    type = "item_money",
                    count = money,
                    usable = false,
                    rare = false,
                    limit = -1,
                    canRemove = true
                }

                table.insert(items, moneyData)
            end

            if Config.IncludeAccounts and accounts ~= nil then
                for key, value in pairs(accounts) do
                    if not shouldSkipAccount(accounts[key].name) then
                        local canDrop = accounts[key].name ~= "bank"

                        if accounts[key].money > 0 then
                            accountData = {
                                label = accounts[key].label,
                                count = accounts[key].money,
                                type = "item_account",
                                name = accounts[key].name,
                                usable = false,
                                rare = false,
                                limit = -1,
                                canRemove = canDrop
                            }
                            table.insert(items, accountData)
                        end
                    end
                end
            end
			
			if carkeys then
                for plate, _ in pairs(carkeys) do
                    local info = {
                        label = plate and (plate .. " Key") or "UNKNOWN KEY",
                        name = "car_keys",
                        type = "car_key_"..plate,
                        count = 1,
                        usable = true,
                        rare = true,
                        limit = -1,
                        canRemove = true
                    }

                    table.insert(items, info)
                end
            end

            for i=1, #Accessory_Items, 1 do
				table.insert(inventory, {
					label = Accessory_Items[i].label,
					count = 1,
					limit = -1,
					type = "item_accessories",
					name = Accessory_Items[i].name,
					usable = true,
					rare = false,
					canRemove = false,
					itemnum = Accessory_Items[i].itemnum,
					itemskin = Accessory_Items[i].itemskin
				})
			end


        

            if inventory ~= nil then
                for key, value in pairs(inventory) do
                    if inventory[key].count <= 0 then
                        inventory[key] = nil
                    else
                        --inventory[key].type = "item_standard"
						
						if inventory[key].type == "item_accessories" then
							inventory[key].type = "item_accessories"
						else
							inventory[key].type = "item_standard"
						end
                    
						table.insert(items, inventory[key])
						
						--[[
						table.insert(
                            items,
                            {
                                label = inventory[key].label,
                                count = inventory[key].count,
                                limit = -1,
                                type = "item_standard",
                                name = inventory[key].name,
                                usable = true,
                                rare = true,
                                canRemove = true
                            }
                        )
						]]
                        --table.insert(items, inventory[key])
						--widgetTotal = getInventoryWeight(items)
                    end
                end
            end

            if Config.IncludeWeapons and weapons ~= nil then
                for key, value in pairs(weapons) do
                    local weaponHash = GetHashKey(weapons[key].name)
                    local playerPed = PlayerPedId()
                    if weapons[key].name ~= "WEAPON_UNARMED" then
                        local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
                        table.insert(
                            items,
                            {
                                label = weapons[key].label,
                                count = ammo,
                                limit = -1,
                                type = "item_weapon",
                                name = weapons[key].name,
                                usable = false,
                                rare = false,
                                canRemove = true
                            }
                        )
                    end
                end
            end
			--[[
			local arrayWeight = Config.localWeight
			local weight = 0
			local itemWeight = 0
			local itemsW = 0
			if items ~= nil then
			for i = 1, #items, 1 do
				if items[i] ~= nil then
				  itemWeight = Config.DefaultWeight
				  itemWeight = itemWeight / items[1].count * 0.0
				if arrayWeight[items[i].name] ~= nil then
				  itemWeight = arrayWeight[items[i].name]
				  items[i].limit = itemWeight / 1000
				end
				  weight = weight + (itemWeight * (items[i].count or 1))
				end
		      end
			end
			
			local texts =  _U("player_info", GetPlayerName(PlayerId()), (weight / 1000), (Config.Limit / 1000))
			
			if weight > Config.Limit then
				TriggerEvent("pNotify:SendNotification",  {
					text =  'ของในตัวคุณ น้ำหนักเกิน ไม่สามารถเดินได้',
					type = "error",
					timeout = 2000,
					layout = "centerLeft"
				})					
			   setHurt()
			   
			   texts = _U("player_info_full", GetPlayerName(PlayerId()), (weight / 1000), (Config.Limit / 1000))
			elseif weight <= Config.Limit then
			   setNotHurt()
			   texts =  _U("player_info", GetPlayerName(PlayerId()), (weight / 1000), (Config.Limit / 1000))
			end
			--]]
            SendNUIMessage(
                {
                    action = "setItems",
                    itemList = items,
					text = texts
					--weight = weight,
					--max = Config.Limit
                }
            )
        end,
        GetPlayerServerId(PlayerId())
    )
end
--[[
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(Config.WeightCheckRate * 1000)
		ESX.TriggerServerCallback("esx_inventoryhud:getPlayerInventoryCount", function(data)
			if data then
				local arrayWeight = Config.localWeight
				local weight, itemWeight, itemsW = 0, 0, 0
				if data ~= nil then
					for k,v in pairs(data) do
						itemWeight = Config.DefaultWeight
						itemWeight = itemWeight / v * 0.0
						if arrayWeight[k] then
							itemWeight = arrayWeight[k]
							weight = weight + (itemWeight * (v or 1))
						end
					end
				end

				if weight > Config.Limit then
					setHurt()
				else
					setNotHurt()
				end
			end
		end)
	end
end)
--]]
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(1)
            if isInInventory then
                local playerPed = PlayerPedId()
                DisableControlAction(0, 1, true) -- Disable pan
                DisableControlAction(0, 2, true) -- Disable tilt
                DisableControlAction(0, 24, true) -- Attack
                DisableControlAction(0, 257, true) -- Attack 2
                DisableControlAction(0, 25, true) -- Aim
                DisableControlAction(0, 263, true) -- Melee Attack 1
                DisableControlAction(0, Keys["W"], true) -- W
                DisableControlAction(0, Keys["A"], true) -- A
                DisableControlAction(0, 31, true) -- S (fault in Keys table!)
                DisableControlAction(0, 30, true) -- D (fault in Keys table!)

                DisableControlAction(0, Keys["R"], true) -- Reload
                DisableControlAction(0, Keys["SPACE"], true) -- Jump
                DisableControlAction(0, Keys["Q"], true) -- Cover
                DisableControlAction(0, Keys["TAB"], true) -- Select Weapon
                DisableControlAction(0, Keys["F"], true) -- Also 'enter'?

                DisableControlAction(0, Keys["F1"], true) -- Disable phone
                DisableControlAction(0, Keys["F2"], true) -- Inventory
                DisableControlAction(0, Keys["F3"], true) -- Animations
                DisableControlAction(0, Keys["F6"], true) -- Job

                DisableControlAction(0, Keys["V"], true) -- Disable changing view
                DisableControlAction(0, Keys["C"], true) -- Disable looking behind
                DisableControlAction(0, Keys["X"], true) -- Disable clearing animation
                DisableControlAction(2, Keys["P"], true) -- Disable pause screen

                DisableControlAction(0, 59, true) -- Disable steering in vehicle
                DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
                DisableControlAction(0, 72, true) -- Disable reversing in vehicle

                DisableControlAction(2, Keys["LEFTCTRL"], true) -- Disable going stealth

                DisableControlAction(0, 47, true) -- Disable weapon
                DisableControlAction(0, 264, true) -- Disable melee
                DisableControlAction(0, 257, true) -- Disable melee
                DisableControlAction(0, 140, true) -- Disable melee
                DisableControlAction(0, 141, true) -- Disable melee
                DisableControlAction(0, 142, true) -- Disable melee
                DisableControlAction(0, 143, true) -- Disable melee
                DisableControlAction(0, 75, true) -- Disable exit vehicle
                DisableControlAction(27, 75, true) -- Disable exit vehicle
                DisableControlAction(0, 288, true) -- Disable exit vehicle
            end
        end
    end
)

function setHurt()
    FreezeEntityPosition(GetPlayerPed(-1), true)
end
			 
function setNotHurt()
	 FreezeEntityPosition(GetPlayerPed(-1), false)
end

AddEventHandler("esx_inventoryhud:closeInventory", function()
    closeInventory()
end) 