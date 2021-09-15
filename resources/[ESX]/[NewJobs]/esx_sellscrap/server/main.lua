ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_sellscrap:sell')
AddEventHandler('esx_sellscrap:sell', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    local GearsPrice = 235 --ราคาขาย
   -- local LeatherPrice = 150

    local GearsQuantity = xPlayer.getInventoryItem('Gears').count
    --local LeatherQuantity = xPlayer.getInventoryItem('leather').count

    if GearsQuantity > 0 then--[[or LeatherQuantity > 0 then]]
        xPlayer.addMoney(GearsQuantity * GearsPrice)
        --xPlayer.addMoney(LeatherQuantity * LeatherPrice)

        xPlayer.removeInventoryItem('Gears', GearsQuantity)
        --xPlayer.removeInventoryItem('leather', LeatherQuantity)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You sold ' .. GearsQuantity .. ' and earned $' .. GearsPrice * GearsQuantity)
   else
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You don\'t have any Gears')
    end
        
end)

function sendNotification(xsource, message, messageType, messageTimeout)
    TriggerClientEvent('notification', xsource, message)
end