ESX = nil
local playersProcessing = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_farmcrab:pickedUp')
AddEventHandler('esx_farmcrab:pickedUp', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('crab')
	local crab = math.random(3, 3)
	--local crab = math.random(10)
	if xItem.limit ~= -1 and (xItem.count + crab) > xItem.limit then
		--
	else
		xPlayer.addInventoryItem(xItem.name, crab)
	end
end)

ESX.RegisterServerCallback('esx_farmcrab:canPickUp', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem(item)

	if xItem.limit ~= -1 and xItem.count >= xItem.limit then
		cb(false)
	else
		cb(true)
	end
end)
ESX.RegisterServerCallback('esx_farmcrab:haveItem', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('sicklecrab')

	if xItem.count >= 1 then
		cb(true)
	else
		cb(false)
	end
end)

RegisterServerEvent('esx_farmcrab:process')
AddEventHandler('esx_farmcrab:process', function()
	if not playersProcessing[source] then
		local _source = source

		--playersProcessing[_source] = ESX.SetTimeout(10000, function()
		playersProcessing[_source] = ESX.SetTimeout(5000, function()
			
			local xPlayer = ESX.GetPlayerFromId(_source)
			local xMin, xMax = xPlayer.getInventoryItem('crab'), xPlayer.getInventoryItem('crab_pro')
			if xMax.limit ~= -1 and (xMax.count + 1) >= xMax.limit then
				--
			elseif xMin.count < 3 then
				--
			else
				xPlayer.removeInventoryItem('crab', 3)
				xPlayer.addInventoryItem('crab_pro', 1)
			end

			playersProcessing[_source] = nil
		end)
	end
end)

function CancelProcessing(playerID)
	if playersProcessing[playerID] then
		ESX.ClearTimeout(playersProcessing[playerID])
		playersProcessing[playerID] = nil
	end
end

function sendNotification(xsource, message, messageType, messageTimeout)
    TriggerClientEvent('notification', xsource, message)
end

RegisterServerEvent('esx_farmcrab:cancelProcessing')
AddEventHandler('esx_farmcrab:cancelProcessing', function()
	CancelProcessing(source)
end)

AddEventHandler('esx:playerDropped', function(playerID, reason)
	CancelProcessing(playerID)
end)

RegisterServerEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
	CancelProcessing(source)
end)
