ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_cow:reward')
AddEventHandler('esx_cow:reward', function(Weight)
    local xPlayer = ESX.GetPlayerFromId(source)

    if Weight >= 1 then
        xPlayer.addInventoryItem('cow', 1)
    elseif Weight >= 9 then
        xPlayer.addInventoryItem('cow', 2)
    elseif Weight >= 15 then
        xPlayer.addInventoryItem('cow', 3)
    end

    xPlayer.addInventoryItem('leather', math.random(1, 1))
        
end)

RegisterServerEvent('esx_cow:cowpack')
AddEventHandler('esx_cow:cowpack', function()
    local xPlayer = ESX.GetPlayerFromId(source)
	local xCow, xCowPack = xPlayer.getInventoryItem('cow'), xPlayer.getInventoryItem('cowpackage')
	if xCowPack.limit ~= -1 and (xCowPack.count) >= xCowPack.limit then
		TriggerClientEvent('esx:showNotification', xPlayer.source, 'cowpackage is full')
	elseif xCow.count < 2 then
		TriggerClientEvent('esx:showNotification', xPlayer.source, 'You don\'t have cow 3 more')
	else
		xPlayer.removeInventoryItem('cow', 2)
		xPlayer.addInventoryItem('cowpackage', 1)

		TriggerClientEvent('esx:showNotification', xPlayer.source, 'You get cowpackage 1 more, waste Cow 3 more')
	end
        
end)

function sendNotification(xsource, message, messageType, messageTimeout)
    TriggerClientEvent('notification', xsource, message)
end