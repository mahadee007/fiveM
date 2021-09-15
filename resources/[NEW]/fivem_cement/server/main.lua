ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Make the kit usable!
ESX.RegisterUsableItem('weapon_crowbar', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if Config.AllowMecano then
		TriggerClientEvent('fivem_cement:onUse', _source)
	else
		if xPlayer.job.name ~= 'mecano' then
			TriggerClientEvent('fivem_cement:onUse', _source)
		end
	end
end)

RegisterServerEvent('fivem_cement:pickedUp')
AddEventHandler('fivem_cement:pickedUp', function()
	local xPlayer = ESX.GetPlayerFromId(source)
    local xItem = xPlayer.getInventoryItem('cement')
    local luck = math.random(1, 3)

	if xItem.limit ~= -1 and (xItem.count) > xItem.limit then
		TriggerClientEvent('esx:showNotification', _source, ('ช่องเก็บของเต็ม'))
	else
		xPlayer.addInventoryItem(xItem.name, luck)
	end
end)

RegisterServerEvent('fivem_cement:Notify')
AddEventHandler('fivem_cement:Notify', function()
    TriggerClientEvent("fivem_cement:Enable", source)
end)


RegisterServerEvent('fivem_cement:InProgress')
AddEventHandler('fivem_cement:InProgress', function(street1, street2, sex)
    TriggerClientEvent("fivem_cement:outlawLockNotify", -1, "~r~Someone is lockpicking a vehicle")
end)


RegisterServerEvent('fivem_cement:InProgressS1')
AddEventHandler('fivem_cement:InProgressS1', function(street1, sex)
    TriggerClientEvent("fivem_cement:outlawLockNotify", -1, "~r~Someone is lockpicking a vehicle")
end)

RegisterServerEvent('fivem_cement:InProgressPos')
AddEventHandler('fivem_cement:InProgressPos', function(tx, ty, tz)
    TriggerClientEvent('fivem_cement:location', -1, tx, ty, tz)
end)

local vehicles = {}

function getVehData(plate, callback)
    MySQL.Async.fetchAll("SELECT * FROM `owned_vehicles`", {},
    function(result)
        local foundIdentifier = nil
        for i=1, #result, 1 do
            local vehicleData = json.decode(result[i].vehicle)
            if vehicleData.plate == plate then
                foundIdentifier = result[i].owner
                break
            end
        end
        if foundIdentifier ~= nil then
            MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = @identifier", {['@identifier'] = foundIdentifier},
            function(result)
                local ownerName = result[1].firstname .. " " .. result[1].lastname

                local info = {
                    plate = plate,
                    owner = ownerName
                }
                callback(info)
            end
          )
        else -- if identifier is nil then...
          local info = {
            plate = plate
          }
          callback(info)
        end
    end)
  end

RegisterNetEvent("fivem_cement:setVehicleDoorsForEveryone")
AddEventHandler("fivem_cement:setVehicleDoorsForEveryone", function(veh, doors, plate)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local veh_model = veh[1]
    local veh_doors = veh[2]
    local veh_plate = veh[3]

    if not vehicles[veh_plate] then
        getVehData(veh_plate, function(veh_data)
            if veh_data.plate ~= plate then
                local players = GetPlayers()
                for _,player in pairs(players) do
                    TriggerClientEvent("fivem_cement:setVehicleDoors", player, table.unpack(veh, doors))
                end
            end
        end)
        vehicles[veh_plate] = true
    end
end)
