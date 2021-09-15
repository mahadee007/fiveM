ESX = nil
local CopsConnected       	   = 0
local RequiredCops = 1
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function CountCops()

	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(5000, CountCops)

end

CountCops()

local _source = source
local xPlayer = ESX.GetPlayerFromId(source)
local selling = false
local success = false
local copscalled = false
local notintrested = false

RegisterNetEvent('drugs:trigger')
AddEventHandler('drugs:trigger', function()
	
	if CopsConnected < RequiredCops then
		TriggerEvent("pNotify:SendNotification", {text = "ต้องมีตำรวจอย่างน้อย 4 คน!", type = "error", timeout = 2000, layout = "centerLeft"})
		--TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. RequiredCops)
		return
	end
	
	selling = true
	
	if selling == true then
		TriggerEvent('pass_or_fail')
  		TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 1)
  		TriggerClientEvent("pNotify:SendNotification", source, {
        text = "คุณกำลังคุยเพื่อเจรจาการขาย!",
        type = "error",
        queue = "lmao",
        timeout = 5000,
        layout = "Centerleft"})
 	end
end)

RegisterServerEvent('fetchjob')
AddEventHandler('fetchjob', function()
    local xPlayer  = ESX.GetPlayerFromId(source)
    TriggerClientEvent('getjob', source, xPlayer.job.name)
end)


RegisterNetEvent('drugs:sell')
AddEventHandler('drugs:sell', function()

	if CopsConnected < RequiredCops then
		TriggerEvent("pNotify:SendNotification", {text = "ต้องมีตำรวจอย่างน้อย 4 คน!", type = "error", timeout = 2000, layout = "centerLeft"})
		--TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. RequiredCops)
		return
	end

  	local xPlayer = ESX.GetPlayerFromId(source)
	--local meth = xPlayer.getInventoryItem('meth_pooch').count
	--local coke 	  = xPlayer.getInventoryItem('coke_pooch').count
	local weed = xPlayer.getInventoryItem('weed_pooch').count
	--local opium = xPlayer.getInventoryItem('opium_pooch').count
	--local paymentc = math.random (500,1000)
	local paymentw = math.random (500,600)
	--local paymentm = math.random (300,700)
	--local paymento = math.random (150,300)


		--[[if coke >= 1 and success == true then
			 	TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
				TriggerClientEvent("pNotify:SendNotification", source, {
					text = "You sold some cocain for $" .. paymentc ,
					type = "success",
					progressBar = false,
					queue = "lmao",
					timeout = 2000,
					layout = "CenterLeft"
			})
			TriggerClientEvent("animation", source)
			xPlayer.removeInventoryItem('coke_pooch', 1)
  			xPlayer.addAccountMoney('black_money', paymentc)
  			selling = false]]
  		if weed >= 1 and success == true then
  				TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
				TriggerClientEvent("pNotify:SendNotification", source, {
					text = "คุณขาย  Marijuana ในราคา $" .. paymentw .. ' [เงินแดง]',
					type = "success",
					progressBar = false,
					queue = "lmao",
					timeout = 2000,
					layout = "CenterLeft"
			})
			TriggerClientEvent("animation", source)
			--TriggerClientEvent("test", source)
  			xPlayer.removeInventoryItem('weed_pooch', 1)
  			--xPlayer.addAccountMoney('black_money', paymentw)
			xPlayer.addAccountMoney('black_money', paymentw)
			--xPlayer.addMoney(paymentw)
  			selling = false
  		  --[[elseif meth >= 1 and success == true then
  				TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
				TriggerClientEvent("pNotify:SendNotification", source, {
					text = "You sold some Meth for $" .. paymentm ,
					type = "success",
					progressBar = false,
					queue = "lmao",
					timeout = 2000,
					layout = "CenterLeft"
			})
			TriggerClientEvent("animation", source)
  			xPlayer.removeInventoryItem('meth_pooch', 1)
  			xPlayer.addAccountMoney('black_money', paymentm)
  			selling = false
  			elseif opium >= 1 and success == true then
  				TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
				TriggerClientEvent("pNotify:SendNotification", source, {
					text = "You have sold some Opium for $" .. paymento ,
					type = "success",
					progressBar = false,
					queue = "lmao",
					timeout = 2000,
					layout = "CenterLeft"
			})
			TriggerClientEvent("animation", source)
			xPlayer.removeInventoryItem('opium_pooch', 1)
  			xPlayer.addAccountMoney('black_money', paymento)
  			selling = false
			elseif selling == true and success == false and notintrested == true then
				TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
				TriggerClientEvent("pNotify:SendNotification", source, {
					text = "They are not interested",
					type = "error",
					progressBar = false,
					queue = "lmao",
					timeout = 2000,
					layout = "CenterLeft"
			})
  			selling = false
  			elseif meth < 1 and coke < 1 and weed < 1 and opium < 1 then
				TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
				TriggerClientEvent("pNotify:SendNotification", source, {
				text = "You dont have any drugs",
				type = "error",
				progressBar = false,
				queue = "lmao",
				timeout = 2000,
				layout = "CenterLeft"
			})]]
			elseif copscalled == true and success == false then
  				TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
				TriggerClientEvent("pNotify:SendNotification", source, {
					text = "บุคคลที่คุณเจรจาด้วยโทรแจ้งตำรวจ!",
					type = "error",
					progressBar = false,
					queue = "lmao",
					timeout = 2000,
					layout = "CenterLeft"
			})
			TriggerClientEvent("notifyc", source)
  			selling = false
  		end
end)

RegisterNetEvent('pass_or_fail')
AddEventHandler('pass_or_fail', function()

	if CopsConnected < RequiredCops then
		TriggerEvent("pNotify:SendNotification", {text = "ต้องมีตำรวจอย่างน้อย 2 คน!", type = "error", timeout = 2000, layout = "centerLeft"})
		--TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. RequiredCops)
		return
	end

  	local percent = math.random(1, 2)

  	if percent == 7 or percent == 8 or percent == 9 then
  		success = false
  		notintrested = true
  	elseif percent ~= 8 and percent ~= 9 and percent ~= 10 and percent ~= 7 then
  		success = true
  		notintrested = false
  	else
  		notintrested = false
  		success = false
  		copscalled = true
  	end
end)

RegisterNetEvent('sell_dis')
AddEventHandler('sell_dis', function()
		TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
		TriggerClientEvent("pNotify:SendNotification", source, {
		text = "คุณอยู่ห่างเกินไป!",
		type = "error",
		progressBar = false,
		queue = "lmao",
		timeout = 2000,
		layout = "CenterLeft"
	})
end)

RegisterNetEvent('checkD')
AddEventHandler('checkD', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	--local meth = xPlayer.getInventoryItem('meth_pooch').count
	--local coke 	  = xPlayer.getInventoryItem('coke_pooch').count
	local weed = xPlayer.getInventoryItem('weed_pooch').count
	--local opium = xPlayer.getInventoryItem('opium_pooch').count

	--if meth >= 1 or coke >= 1 or weed >= 1 or opium >= 1 then
	if weed >= 1 then
		TriggerClientEvent("checkR", source, true)
	else
		TriggerClientEvent("checkR", source, false)
	end

end)
