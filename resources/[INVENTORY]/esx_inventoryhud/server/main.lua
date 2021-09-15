ESX = nil

local arrayWeight = Config.localWeight

TriggerEvent(
	"esx:getSharedObject",
	function(obj)
		ESX = obj
	end
)

ESX.RegisterServerCallback(
	"esx_inventoryhud:getPlayerInventory",
	function(source, cb, target)
		local targetXPlayer = ESX.GetPlayerFromId(target)

		if targetXPlayer ~= nil then
			cb({inventory = targetXPlayer.inventory, money = targetXPlayer.getMoney(), accounts = targetXPlayer.accounts, weapons = targetXPlayer.loadout})
		else
			cb(nil)
		end
	end
)

ESX.RegisterServerCallback("esx_inventoryhud:getPlayerInventoryCount",
function(source, cb)
	local targetXPlayer = ESX.GetPlayerFromId(source)

	if targetXPlayer ~= nil then
		local tbl = {}
		for k,v in pairs(targetXPlayer.inventory) do
			if v.count > 0 then
				tbl[v.name] = v.count
			end
		end
		cb(tbl)
	else
		cb(nil)
	end
end)

RegisterServerEvent('esx_inventoryhud:getOwnerAccessories')
AddEventHandler('esx_inventoryhud:getOwnerAccessories', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local AccessoriesItems = {}

	-- Accessories Helmet
	local Result_Helmet = MySQL.Sync.fetchAll('SELECT * FROM meeta_accessory_inventory WHERE owner = @owner AND type = @type', {
		['@owner'] = xPlayer.identifier,
		['@type'] = 'player_helmet'
	})

	if Result_Helmet[1] then
		for k,v in pairs(Result_Helmet) do
			local skin = json.decode(v.skin)
			table.insert(AccessoriesItems, {
				label = v.label,
				count = 1,
				limit = -1,
				type = "item_accessories",
				name = "helmet",
				usable = true,
				rare = false,
				canRemove = false,
				itemnum = skin["helmet_1"],
				itemskin = skin["helmet_2"]
			})
		end
	end

	-- Accessories Mask
	local Result_Mask = MySQL.Sync.fetchAll('SELECT * FROM meeta_accessory_inventory WHERE owner = @owner AND type = @type', {
		['@owner'] = xPlayer.identifier,
		['@type'] = 'player_mask'
	})

	if Result_Mask[1] then
		for k,v in pairs(Result_Mask) do
			local skin = json.decode(v.skin)
			table.insert(AccessoriesItems, {
				label = v.label,
				count = 1,
				limit = -1,
				type = "item_accessories",
				name = "mask",
				usable = true,
				rare = false,
				canRemove = false,
				itemnum = skin["mask_1"],
				itemskin = skin["mask_2"]
			})
		end
	end

	-- Accessories Glasses
	local Result_Glasses = MySQL.Sync.fetchAll('SELECT * FROM meeta_accessory_inventory WHERE owner = @owner AND type = @type', {
		['@owner'] = xPlayer.identifier,
		['@type'] = 'player_glasses'
	})

	if Result_Glasses[1] then
		for k,v in pairs(Result_Glasses) do
			local skin = json.decode(v.skin)
			table.insert(AccessoriesItems, {
				label = v.label,
				count = 1,
				limit = -1,
				type = "item_accessories",
				name = "glasses",
				usable = true,
				rare = false,
				canRemove = false,
				itemnum = skin["glasses_1"],
				itemskin = skin["glasses_2"]
			})
		end
	end

	-- Accessories Torso
	local Result_Torso = MySQL.Sync.fetchAll('SELECT * FROM meeta_accessory_inventory WHERE owner = @owner AND type = @type', {
		['@owner'] = xPlayer.identifier,
		['@type'] = 'player_torso'
	})

	if Result_Torso[1] then
		for k,v in pairs(Result_Torso) do
			local skin = json.decode(v.skin)
			table.insert(AccessoriesItems, {
				label = v.label,
				count = 1,
				limit = -1,
				type = "item_accessories",
				name = "torso",
				usable = true,
				rare = false,
				canRemove = false,
				itemnum = skin["torso_1"],
				itemskin = skin["torso_2"]
			})
		end
	end

	-- Accessories Pants
	local Result_Pants = MySQL.Sync.fetchAll('SELECT * FROM meeta_accessory_inventory WHERE owner = @owner AND type = @type', {
		['@owner'] = xPlayer.identifier,
		['@type'] = 'player_pants'
	})

	if Result_Pants[1] then
		for k,v in pairs(Result_Pants) do
			local skin = json.decode(v.skin)
			table.insert(AccessoriesItems, {
				label = v.label,
				count = 1,
				limit = -1,
				type = "item_accessories",
				name = "pants",
				usable = true,
				rare = false,
				canRemove = false,
				itemnum = skin["pants_1"],
				itemskin = skin["pants_2"]
			})
		end
	end

	-- Accessories Earring
	local Result_Earring = MySQL.Sync.fetchAll('SELECT * FROM meeta_accessory_inventory WHERE owner = @owner AND type = @type', {
		['@owner'] = xPlayer.identifier,
		['@type'] = 'player_ears'
	})

	if Result_Earring[1] then
		for k,v in pairs(Result_Earring) do
			local skin = json.decode(v.skin)
			table.insert(AccessoriesItems, {
				label = v.label,
				count = 1,
				limit = -1,
				type = "item_accessories",
				name = "earring",
				usable = true,
				rare = false,
				canRemove = false,
				itemnum = skin["ears_1"],
				itemskin = skin["ears_2"]
			})
		end
	end

	TriggerClientEvent("esx_inventoryhud:setOwnerAccessories", _source, AccessoriesItems)

end)

RegisterServerEvent("esx_inventoryhud:tradePlayerItem")
AddEventHandler(
	"esx_inventoryhud:tradePlayerItem",
	function(from, target, type, itemName, itemCount)
		local _source = from

		local sourceXPlayer = ESX.GetPlayerFromId(_source)
		local targetXPlayer = ESX.GetPlayerFromId(target)

		if type == "item_standard" then
			local sourceItem = sourceXPlayer.getInventoryItem(itemName)
			local targetItem = targetXPlayer.getInventoryItem(itemName)

			if itemCount > 0 and sourceItem.count >= itemCount then
				if targetItem.limit ~= -1 and (targetItem.count + itemCount) > targetItem.limit then
				else
					sourceXPlayer.removeInventoryItem(itemName, itemCount)
					targetXPlayer.addInventoryItem(itemName, itemCount)
				end
			end
		elseif type == "item_money" then
			if itemCount > 0 and sourceXPlayer.getMoney() >= itemCount then
				sourceXPlayer.removeMoney(itemCount)
				targetXPlayer.addMoney(itemCount)
			end
		elseif type == "item_account" then
			if itemCount > 0 and sourceXPlayer.getAccount(itemName).money >= itemCount then
				sourceXPlayer.removeAccountMoney(itemName, itemCount)
				targetXPlayer.addAccountMoney(itemName, itemCount)
			end
		elseif type == "item_weapon" then
			if not targetXPlayer.hasWeapon(itemName) then
				sourceXPlayer.removeWeapon(itemName)
				targetXPlayer.addWeapon(itemName, itemCount)
			end
		end
	end
)

RegisterCommand(
	"openinventory",
	function(source, args, rawCommand)
		if IsPlayerAceAllowed(source, "inventory.openinventory") then
			local target = tonumber(args[1])
			local targetXPlayer = ESX.GetPlayerFromId(target)

			if targetXPlayer ~= nil then
				TriggerClientEvent("esx_inventoryhud:openPlayerInventory", source, target, targetXPlayer.name)
			else
				TriggerClientEvent("chatMessage", source, "^1" .. _U("no_player"))
			end
		else
			TriggerClientEvent("chatMessage", source, "^1" .. _U("no_permissions"))
		end
	end
)

-- Return the sum of all item in pPlayer inventory
function getInventoryWeight(pPlayer)
	local weight = 0
	local itemWeight = 0

	if #pPlayer.inventory > 0 then
		for i=1, #pPlayer.inventory, 1 do
			if pPlayer.inventory[i] ~= nil then
				itemWeight = Config.DefaultWeight
				if arrayWeight[pPlayer.inventory[i].name] ~= nil then
					itemWeight = arrayWeight[pPlayer.inventory[i].name]
				end
				weight = weight + (itemWeight * pPlayer.inventory[i].count)
			end
		end
	end

	return weight
end

-- Get user speed
-- https://runtime.fivem.net/doc/reference.html#_0x6DB47AA77FD94E09

RegisterServerEvent('esx_inventoryhud:FUpdate')
AddEventHandler('esx_inventoryhud:FUpdate', function(xPlayer)
  local source_ = source
  local weight = getInventoryWeight(xPlayer)
  TriggerClientEvent('esx_inventoryhud:change',source_,weight)
end)


RegisterServerEvent('esx_inventoryhud:Update')
AddEventHandler('esx_inventoryhud:Update', function(source)
  local source_ = source
  local xPlayer = ESX.GetPlayerFromId(source_)
  local weight = getInventoryWeight(xPlayer)
  TriggerClientEvent('esx_inventoryhud:change',source_,weight)
end)



RegisterServerEvent('esx:onAddInventoryItem')
AddEventHandler('esx:onAddInventoryItem', function(source, item, count)
	local source_ = source
	local xPlayer = ESX.GetPlayerFromId(source_)
	local currentInventoryWeight = getInventoryWeight(xPlayer)
	TriggerEvent('esx_inventoryhud:Update',source_)
	if currentInventoryWeight > Config.Limit then
	--[[	local xPlayer = ESX.GetPlayerFromId(source_)
		local itemWeight = Config.DefaultWeight

		-- Get weight if it exists of current item
		if arrayWeight[item.name] then
			itemWeight = arrayWeight[item.name]
		end
		local qty = 0
		local weightTooMuch = 0
		weightTooMuch = currentInventoryWeight - Config.Limit
		qty = math.floor(weightTooMuch / itemWeight) + 1

		-- Should be false all the time. But can be true on fresh install
		if qty > count then
			qty = count
		end
		
		--ESX.CreatePickup('item_standard', item.name, qty, item.label..'['..qty..']', source_)
		--TriggerClientEvent('esx:showNotification', source_, '~s~Remove ~r~' .. qty .. 'x ' .. item.label .. '~s~ from your inventory')
		--xPlayer.removeInventoryItem(item.name, qty)
		TriggerEvent('esx_inventoryhud:Update',source_)]]
	end
end)

RegisterServerEvent('esx:onRemoveInventoryItem')
AddEventHandler('esx:onRemoveInventoryItem', function(source, item, count)
  TriggerEvent('esx_inventoryhud:Update',source)
    if Config.userSpeed == true then
      local source_ = source
      local xPlayer = ESX.GetPlayerFromId(source_)
      local currentInventoryWeight = getInventoryWeight(xPlayer)
      local speed = getUserSpeed(currentInventoryWeight)
    end
end)
