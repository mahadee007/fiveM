ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_sellcrab:sell')
AddEventHandler('esx_sellcrab:sell', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    local CrabPrice = 244 --ราคาขาย
   -- local LeatherPrice = 150

    local CrabQuantity = xPlayer.getInventoryItem('crab_pro').count
    --local LeatherQuantity = xPlayer.getInventoryItem('leather').count

    if CrabQuantity > 0 then--[[or LeatherQuantity > 0 then]]
        xPlayer.addMoney(CrabQuantity * CrabPrice)
        --xPlayer.addMoney(LeatherQuantity * LeatherPrice)

        xPlayer.removeInventoryItem('crab_pro', CrabQuantity)
        --xPlayer.removeInventoryItem('leather', LeatherQuantity)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You sold ' .. CrabQuantity .. ' and earned $' .. CrabPrice * CrabQuantity)
   else
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You don\'t have any Crab Pack')
    end
        
end)

function sendNotification(xsource, message, messageType, messageTimeout)
    TriggerClientEvent('notification', xsource, message)
end