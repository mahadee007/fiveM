ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx-killdeer:reward')
AddEventHandler('esx-killdeer:reward', function(Weight)
    local xPlayer = ESX.GetPlayerFromId(source)

    if Weight >= 1 then
        xPlayer.addInventoryItem('deer', 1)
    elseif Weight >= 9 then
        xPlayer.addInventoryItem('deer', 2)
    elseif Weight >= 15 then
        xPlayer.addInventoryItem('deer', 3)
    end

    xPlayer.addInventoryItem('ledeer', math.random(1, 4))
        
end)

RegisterServerEvent('esx-killdeer:sell')
AddEventHandler('esx-killdeer:sell', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    local MeatPrice = 148
    local LeatherPrice = 20

    local MeatQuantity = xPlayer.getInventoryItem('deer').count
    local LeatherQuantity = xPlayer.getInventoryItem('ledeer').count

    if MeatQuantity > 0 or LeatherQuantity > 0 then
        xPlayer.addMoney(MeatQuantity * MeatPrice)
        xPlayer.addMoney(LeatherQuantity * LeatherPrice)

        xPlayer.removeInventoryItem('deer', MeatQuantity)
        xPlayer.removeInventoryItem('ledeer', LeatherQuantity)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You sold ' .. LeatherQuantity + MeatQuantity .. ' and earned $' .. LeatherPrice * LeatherQuantity + MeatPrice * MeatQuantity)
    else
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You don\'t have any deer or ledeer')
    end
        
end)

function sendNotification(xsource, message, messageType, messageTimeout)
    TriggerClientEvent('notification', xsource, message)
end