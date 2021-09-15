 local PlayersWashing = {}
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local function WhiteningMoney(source,percent)
	local source = source
		SetTimeout(10000, function()

		if PlayersWashing[source] == true then
			local xPlayer		= ESX.GetPlayerFromId(source)
			local blackMoney	= xPlayer.getAccount('black_money')
			local _percent		= Config.Percentage
			
			if blackMoney.money < Config.Slice then
				TriggerClientEvent('cac33a64-d48a-40fd-a4cd-58787b99e587', source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('Nocash') .. Config.Slice)
			else
				local bonus = math.random(Config.Bonus.min, Config.Bonus.max)
				local washedMoney = math.floor(Config.Slice / 100 * (_percent + bonus))

				xPlayer.removeAccountMoney('black_money', Config.Slice)
				xPlayer.addMoney(washedMoney)
				WhiteningMoney(source,_percent)
				
				TriggerClientEvent('cac33a64-d48a-40fd-a4cd-58787b99e587', source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('cash') .. washedMoney .. _U('cash1'))
			end
		end
	end)
end

RegisterServerEvent('05e29166-b7d5-47b7-8f30-f44fe5136eed')
AddEventHandler('05e29166-b7d5-47b7-8f30-f44fe5136eed', function(amount)
	local xPlayer 		= ESX.GetPlayerFromId(source)
	local account 		= xPlayer.getAccount('black_money')
	local _percent		= Config.Percentage

	if amount > 0 and account.money >= amount then
		
		local bonus = math.random(Config.Bonus.min, Config.Bonus.max)
		local washedMoney = math.floor(amount / 100 * (_percent + bonus))	

		xPlayer.removeAccountMoney('black_money', amount)
		xPlayer.addMoney(washedMoney)
		
		TriggerClientEvent('cac33a64-d48a-40fd-a4cd-58787b99e587', source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('cash') .. washedMoney .. _U('cash1'))
		
	else
		TriggerClientEvent('cac33a64-d48a-40fd-a4cd-58787b99e587', source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('invalid_amount'))
	end

end)

RegisterServerEvent('dac2167e-ea68-4387-9cea-060fe9a0f6d9')
AddEventHandler('dac2167e-ea68-4387-9cea-060fe9a0f6d9', function(percent)
	PlayersWashing[source] = true
	TriggerClientEvent('cac33a64-d48a-40fd-a4cd-58787b99e587', source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('Whitening'))
	WhiteningMoney(source,percent)
end)

RegisterServerEvent('1ec5bb6a-94b0-4d2d-ab1f-946c1d6404e4')
AddEventHandler('1ec5bb6a-94b0-4d2d-ab1f-946c1d6404e4', function()
	PlayersWashing[source] = false
	TriggerClientEvent('cac33a64-d48a-40fd-a4cd-58787b99e587', source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('Nothere'))
end)


RegisterServerEvent('614860eb-bf56-40cd-b278-41f7461a64f8')
AddEventHandler('614860eb-bf56-40cd-b278-41f7461a64f8', function()
	PlayersWashing[source] = false
end)
