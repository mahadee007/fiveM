ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('bread', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bread', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	--TriggerClientEvent('esx:showNotification', source, _U('used_bread'))
	TriggerClientEvent("pNotify:SendNotification", source, {
		    text = 'กินขนมปัง ',
		    type = "success",
		    timeout = 2000,
		    layout = "centerLeft"
		})
end)

ESX.RegisterUsableItem('chocolate', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('chocolate', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	--TriggerClientEvent('esx:showNotification', source, _U('used_chocolate'))
	TriggerClientEvent("pNotify:SendNotification", source, {
		    text = 'กินช็อคโกแลต ',
		    type = "success",
		    timeout = 2000,
		    layout = "centerLeft"
		})
end)

ESX.RegisterUsableItem('sandwich', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sandwich', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	--TriggerClientEvent('esx:showNotification', source, _U('used_sandwich'))
	TriggerClientEvent("pNotify:SendNotification", source, {
		    text = 'กินแซนด์วิช ',
		    type = "success",
		    timeout = 2000,
		    layout = "centerLeft"
		})
end)

ESX.RegisterUsableItem('hamburger', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('hamburger', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	--TriggerClientEvent('esx:showNotification', source, _U('used_hamburger'))
	TriggerClientEvent("pNotify:SendNotification", source, {
		    text = 'กินแฮมเบอร์เกอร์ ',
		    type = "success",
		    timeout = 2000,
		    layout = "centerLeft"
		})
end)

ESX.RegisterUsableItem('cupcake', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cupcake', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	--TriggerClientEvent('esx:showNotification', source, _U('used_cupcake'))
	TriggerClientEvent("pNotify:SendNotification", source, {
		    text = 'กินคัพเค้ก ',
		    type = "success",
		    timeout = 2000,
		    layout = "centerLeft"
		})
end)

ESX.RegisterUsableItem('water', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('water', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	--TriggerClientEvent('esx:showNotification', source, _U('used_water'))
	TriggerClientEvent("pNotify:SendNotification", source, {
		    text = 'ดื่มน้ำ ',
		    type = "success",
		    timeout = 2000,
		    layout = "centerLeft"
		})
end)

ESX.RegisterUsableItem('cocacola', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cocacola', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	--TriggerClientEvent('esx:showNotification', source, _U('used_cocacola'))
	TriggerClientEvent("pNotify:SendNotification", source, {
		    text = 'กิน โค๊ก ',
		    type = "success",
		    timeout = 2000,
		    layout = "centerLeft"
		})
end)

ESX.RegisterUsableItem('icetea', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('icetea', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	--TriggerClientEvent('esx:showNotification', source, _U('used_icetea'))
	TriggerClientEvent("pNotify:SendNotification", source, {
		    text = 'ดื่มชาเย็น ',
		    type = "success",
		    timeout = 2000,
		    layout = "centerLeft"
		})
end)

ESX.RegisterUsableItem('coffe', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('coffe', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	--TriggerClientEvent('esx:showNotification', source, _U('used_coffe'))
	TriggerClientEvent("pNotify:SendNotification", source, {
		    text = 'ดื่มกาแฟ ',
		    type = "success",
		    timeout = 2000,
		    layout = "centerLeft"
		})
end)

-- Bar stuff
ESX.RegisterUsableItem('wine', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('wine', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	--TriggerClientEvent('esx:showNotification', source, _U('used_wine'))
	TriggerClientEvent("pNotify:SendNotification", source, {
		    text = 'ดื่ม wine ',
		    type = "success",
		    timeout = 2000,
		    layout = "centerLeft"
		})
end)

ESX.RegisterUsableItem('beer', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('beer', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	--TriggerClientEvent('esx:showNotification', source, _U('used_beer'))
	TriggerClientEvent("pNotify:SendNotification", source, {
		    text = 'ดื่มเบียร์ ',
		    type = "success",
		    timeout = 2000,
		    layout = "centerLeft"
		})
end)

ESX.RegisterUsableItem('vodka', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vodka', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 300000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	--TriggerClientEvent('esx:showNotification', source, _U('used_vodka'))
	TriggerClientEvent("pNotify:SendNotification", source, {
		    text = 'ดื่มวอดก้า ',
		    type = "success",
		    timeout = 2000,
		    layout = "centerLeft"
		})
end)

ESX.RegisterUsableItem('whisky', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('whisky', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 300000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	--TriggerClientEvent('esx:showNotification', source, _U('used_whisky'))
	TriggerClientEvent("pNotify:SendNotification", source, {
		    text = 'ดื่มวิสกี้ ',
		    type = "success",
		    timeout = 2000,
		    layout = "centerLeft"
		})
end)

ESX.RegisterUsableItem('tequila', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tequila', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	--TriggerClientEvent('esx:showNotification', source, _U('used_tequila'))
	TriggerClientEvent("pNotify:SendNotification", source, {
		    text = 'ดื่มเตกีล่า ',
		    type = "success",
		    timeout = 2000,
		    layout = "centerLeft"
		})
	
end)

ESX.RegisterUsableItem('milk', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('milk', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', -150000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	--TriggerClientEvent('esx:showNotification', source, _U('used_milk'))
	TriggerClientEvent("pNotify:SendNotification", source, {
		    text = 'ดื่มนม ',
		    type = "success",
		    timeout = 2000,
		    layout = "centerLeft"
		})
end)

-- marijuana cigarett
ESX.RegisterUsableItem('marijuana_cigarette', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local lighter = xPlayer.getInventoryItem('lighter')
	
		if lighter.count > 0 then
			xPlayer.removeInventoryItem('marijuana_cigarette', 1)
			TriggerClientEvent('esx_status:add', source, 'drunk', 300000)
			TriggerClientEvent('esx_cigarett:startmarijuana', source)
			TriggerClientEvent("pNotify:SendNotification", source, {
		    text = 'สูบกัญชา ',
		    type = "success",
		    timeout = 2000,
		    layout = "centerLeft"
		})
		else
			TriggerClientEvent("pNotify:SendNotification", source, {
		    text = 'คุณไม่มีไฟแช็ก ',
		    type = "error",
		    timeout = 2000,
		    layout = "centerLeft"
		})
		end
end)

-- marijuana weed_pooch
ESX.RegisterUsableItem('weed_pooch', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local lighter = xPlayer.getInventoryItem('lighter')
	local bong = xPlayer.getInventoryItem('bong')
	
		if lighter.count > 0 and bong.count > 0then
			xPlayer.removeInventoryItem('weed_pooch', 1)
			TriggerClientEvent('esx_status:add', source, 'drunk', 450000)
			TriggerClientEvent('esx_weedpooch:Onbong', source)
			TriggerClientEvent("pNotify:SendNotification", source, {
		    text = 'สูบกัญชา ',
		    type = "success",
		    timeout = 2000,
		    layout = "centerLeft"
		})
		else
			TriggerClientEvent("pNotify:SendNotification", source, {
		    text = 'คุณต้องมีบ้องกับไฟแช็ก ',
		    type = "error",
		    timeout = 2000,
		    layout = "centerLeft"
		})
		end
end)

-- Cigarett
ESX.RegisterUsableItem('cigarett', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local lighter = xPlayer.getInventoryItem('lighter')
	
		if lighter.count > 0 then
			xPlayer.removeInventoryItem('cigarett', 1)
			TriggerClientEvent('esx_cigarett:startSmoke', source)
			TriggerClientEvent("pNotify:SendNotification", source, {
		    text = 'สูบบุหรี่ ',
		    type = "success",
		    timeout = 2000,
		    layout = "centerLeft"
		})
		else
			TriggerClientEvent("pNotify:SendNotification", source, {
		    text = 'คุณไม่มีไฟแช็ก ',
		    type = "success",
		    timeout = 2000,
		    layout = "centerLeft"
		})
		end
end)




TriggerEvent('es:addGroupCommand', 'heal', 'admin', function(source, args, user)
	-- heal another player - don't heal source
	if args[1] then
		local target = tonumber(args[1])
		
		-- is the argument a number?
		if target ~= nil then
			
			-- is the number a valid player?
			if GetPlayerName(target) then
				print('esx_basicneeds: ' .. GetPlayerName(source) .. ' is healing a player!')
				TriggerClientEvent('esx_basicneeds:healPlayer', target)
				TriggerClientEvent('chatMessage', target, "HEAL", {223, 66, 244}, "You have been healed!")
			else
				TriggerClientEvent('chatMessage', source, "HEAL", {255, 0, 0}, "Player not found!")
			end
		else
			TriggerClientEvent('chatMessage', source, "HEAL", {255, 0, 0}, "Incorrect syntax! You must provide a valid player ID")
		end
	else
		-- heal source
		print('esx_basicneeds: ' .. GetPlayerName(source) .. ' is healing!')
		TriggerClientEvent('esx_basicneeds:healPlayer', source)
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "HEAL", {255, 0, 0}, "Insufficient Permissions.")
end, {help = "Heal a player, or yourself - restores thirst, hunger and health."})