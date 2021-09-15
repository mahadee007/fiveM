ESX = nil
local playersProcessing = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_steelscrap:pickedUp')
AddEventHandler('esx_steelscrap:pickedUp', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('SteelScrap')
	local SteelScrap = math.random(2, 2)
	--local SteelScrap = math.random(10)
	if xItem.limit ~= -1 and (xItem.count + SteelScrap) > xItem.limit then
		--
	else
		xPlayer.addInventoryItem(xItem.name, SteelScrap)
	end
end)

ESX.RegisterServerCallback('esx_steelscrap:canPickUp', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem(item)

	if xItem.limit ~= -1 and xItem.count >= xItem.limit then
		cb(false)
	else
		cb(true)
	end
end)
ESX.RegisterServerCallback('esx_steelscrap:haveItem', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('welding_gun')

	if xItem.count >= 1 then
		cb(true)
	else
		cb(false)
	end
end)

RegisterServerEvent('esx_steelscrap:process')
AddEventHandler('esx_steelscrap:process', function()
	if not playersProcessing[source] then
		local _source = source

		--playersProcessing[_source] = ESX.SetTimeout(10000, function()
		playersProcessing[_source] = ESX.SetTimeout(5000, function()
			
			local xPlayer = ESX.GetPlayerFromId(_source)
			local xMin, xMax = xPlayer.getInventoryItem('SteelScrap'), xPlayer.getInventoryItem('Gears')
			if xMax.limit ~= -1 and (xMax.count + 1) >= xMax.limit then
				--
			elseif xMin.count < 2 then
				--
			else
				xPlayer.removeInventoryItem('SteelScrap', 2)
				xPlayer.addInventoryItem('Gears', 1)
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

RegisterServerEvent('esx_steelscrap:cancelProcessing')
AddEventHandler('esx_steelscrap:cancelProcessing', function()
	CancelProcessing(source)
end)

AddEventHandler('esx:playerDropped', function(playerID, reason)
	CancelProcessing(playerID)
end)

RegisterServerEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
	CancelProcessing(source)
end)
