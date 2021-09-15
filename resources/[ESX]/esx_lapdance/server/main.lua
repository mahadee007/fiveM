ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_lapdance:Buy')
AddEventHandler('esx_lapdance:Buy', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 1250) then
	xPlayer.removeMoney(1250)
	TriggerClientEvent('esx_lapdance:lapdance', _source)
	sendNotification(_source, 'คุณบริจาค 1,250$ เพื่อไถชีวิตโคโยตี้', 'success', 2500)
	else
	sendNotification(_source, 'มีเงินไม่พอสำหรับบริจาคให้น้องโคโยตี้', 'error', 2500)
	end

end)

--notification
function sendNotification(xSource, message, messageType, messageTimeout)
    TriggerClientEvent("pNotify:SendNotification", xSource, {
        text = message,
        type = messageType,
        queue = "lmao",
        timeout = messageTimeout,
        layout = "bottomCenter"
    })
end