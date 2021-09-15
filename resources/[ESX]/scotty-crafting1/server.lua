ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('scotty:craftGetItems1', function(source, cb)
	cb(ESX.Items)
end)



function RemoveByBlueprint(source, list, multi)
	multi = multi or 1
	
	local xPlayer = ESX.GetPlayerFromId(source)
	local to_remove = 0
	for k,v in pairs(list) do
		to_remove = to_remove + (v * multi)
	end
	
	for k,v in pairs(xPlayer.inventory) do
		if list[v.name] and v.count > 0 then
			local d = list[v.name]
			if d <= v.count then
				to_remove = to_remove - v.count
			end
		end
	end
	
	if to_remove <= 0 then
		for k,v in pairs(list) do
			xPlayer.removeInventoryItem(k, v * multi)
		end
		return true
	else
		return false
	end
end

function firstToUpper(str)
	return (str:gsub("^%l", string.upper))
end

RegisterServerEvent('scotty:craftItem1')
AddEventHandler('scotty:craftItem1', function(category, id, amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if Config["category"][category] == nil
	or Config["category"][category]["list"] == nil
	or Config["category"][category]["list"][id] == nil
	or xPlayer == nil then
		return
	end
		
	local data = Config["category"][category]["list"][id]
	local item = xPlayer.getInventoryItem(data.item)
	local iswep = string.find(string.lower(data.item), "weapon_")
	
	if not iswep and item == nil then
		return
	end
	
	if iswep then
		item = {
			label = firstToUpper(data.item:gsub("weapon_",""))
		}
	end
	
	local money = xPlayer.getMoney()
	local item_cost
	
	if data.cost ~= nil and data.cost > 0
	or Config["craft_cost"] ~= nil and Config["craft_cost"] > 0 then
		local cost = data.cost or Config["craft_cost"]
		if money < cost then
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = string.format(Config["translate"]["no_money2"], cost),
				type = "error",
				queue = "right",
				timeout = 5000,
				layout = "centerRight"
			})
			return
		else
			item_cost = cost
		end
	end
	
	data.amount = data.amount or 1

	local removed = RemoveByBlueprint(_source, data.blueprint, amount)
	if removed then
		local good = true
		if Config["craft_enable_fail"] and data.fail_chance then
			local f = (data.fail_chance / 100)
			local rand = math.random()
			local plyName = GetPlayerName(source)

			if rand <= f then
				good = false
				TriggerClientEvent("pNotify:SendNotification", _source, {
					text = string.format(Config["translate"]["you_blow"], item and item.label or "Unknown"),
					type = "error",
					queue = "right",
					timeout = 5000,
					layout = "centerRight"
				})
								TriggerClientEvent('audio:unsuccess',source)

												sendDiscord('Crafting', '**Name: **'.. plyName .. '** คราฟไอเท็มไอเท็มไม่สำเร็จ **')

			end
		end
		
		if item_cost ~= nil then
			xPlayer.removeMoney(item_cost)
		end
		
		if good then
			if string.match(string.lower(data.item), "weapon_") then
				xPlayer.addWeapon(data.item, data.ammo or 0)
			else
				xPlayer.addInventoryItem(data.item, data.amount * (amount or 1))
			end
		local plyName = GetPlayerName(source)
	
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = string.format(Config["translate"]["you_crafted"], item and item.label or "Unknown", data.amount * (amount or 1)),
				type = "success",
				queue = "right",
				timeout = 5000,
				layout = "centerRight"
			})
							TriggerClientEvent('audio:success',source)

								sendDiscord('Crafting', '**Name: **'.. plyName .. '** | คราฟไอเท็มไอเท็มสำเร็จ: **'  .. itemLabel(data.item, xPlayer.inventory))

		end
	else
		TriggerClientEvent("pNotify:SendNotification", _source, {
			text = Config["translate"]["not_enough"],
			type = "error",
			queue = "right",
			timeout = 5000,
			layout = "centerRight"
		})
	end
end)


webhookurl = 'https://discordapp.com/api/webhooks/686548967214809130/x13srv8q7QW0BJOUbUJi-8nEBoeulOIZOZ9HfH10YyfHQsNQGRYpN_gytxvZsh9Q-6xI'


function sendDiscord(name, message)
	local content = {
        {
        	["color"] = '2061822',
            ["title"] = message,
       --     ["description"] = message,
            ["footer"] = {
            ["text"] = "Created BY Nakimi",
            },
        }
    }
  	PerformHttpRequest(webhookurl, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })
end

function itemLabel(name, inventory)
	if string.match(string.lower(name), "weapon_") then
		return ESX.GetWeaponLabel(name)
	else
		for i=1, #inventory, 1 do
			if inventory[i].name == name then
				return inventory[i].label
			end
		end
	end
	return "unknown item"
end

