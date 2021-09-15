ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx-killmonkey:reward')
AddEventHandler('esx-killmonkey:reward', function(Weight)
    local xPlayer = ESX.GetPlayerFromId(source)

    if Weight >= 1 then
        xPlayer.addInventoryItem('monkey', 1)
    elseif Weight >= 9 then
        xPlayer.addInventoryItem('monkey', 2)
    elseif Weight >= 15 then
        xPlayer.addInventoryItem('monkey', 3)
    end

    xPlayer.addInventoryItem('lemonkey', math.random(1, 4))
        
end)

RegisterServerEvent('esx-killmonkey:sell')
AddEventHandler('esx-killmonkey:sell', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    local MeatPrice = 104
    local LeatherPrice = 25

    local MeatQuantity = xPlayer.getInventoryItem('monkey').count
    local LeatherQuantity = xPlayer.getInventoryItem('lemonkey').count

    if MeatQuantity > 0 or LeatherQuantity > 0 then
        xPlayer.addMoney(MeatQuantity * MeatPrice)
        xPlayer.addMoney(LeatherQuantity * LeatherPrice)

        xPlayer.removeInventoryItem('monkey', MeatQuantity)
        xPlayer.removeInventoryItem('lemonkey', LeatherQuantity)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You sold ' .. LeatherQuantity + MeatQuantity .. ' and earned $' .. LeatherPrice * LeatherQuantity + MeatPrice * MeatQuantity)
    else
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You don\'t have any monkey or lemonkey')
    end
        
end)

function sendNotification(xsource, message, messageType, messageTimeout)
    TriggerClientEvent('notification', xsource, message)
end