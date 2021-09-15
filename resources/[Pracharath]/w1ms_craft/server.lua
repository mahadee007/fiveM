ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('w1ms_craft:getPlayerInventory')
AddEventHandler('w1ms_craft:getPlayerInventory', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer ~= nil then
		TriggerClientEvent('w1ms_craft:openMenu', _source, xPlayer.inventory)
	end
end)

function findRecipe(list)
	for item, ingredients in pairs(Config.Recipes) do
		if #ingredients == #list then
			-- same length, let's compare
			local found = 0
			for i=1, #ingredients, 1 do
				for j=1, #list, 1 do
					if ingredients[i].item == list[j].item and ingredients[i].quantity == list[j].quantity then
						found = found + 1
					end
				end
			end
			if found == #list then
				return item
			end
		end
	end
	return false
end

function hasAllIngredients(inventory, ingredients)
	for i=1, #ingredients, 1 do
		for j=1, #inventory, 1 do
			if ingredients[i].name == inventory[j].name then
				if inventory[j].count < ingredients[i].quantity then
					return false
				end
			end
		end
	end
	return true
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

RegisterServerEvent('w1ms_craft:craftItem')
AddEventHandler('w1ms_craft:craftItem', function(ingredients)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local item = findRecipe(ingredients)
	if not item then
		TriggerClientEvent('esx:showNotification', _source, 'No recipe found with these ingredients')
	else
		if xPlayer ~= nil then
			if hasAllIngredients(xPlayer.inventory, Config.Recipes[item]) then
				for _,ingredient in pairs(Config.Recipes[item]) do
					if (ingredient.remove ~= nil and ingredient.remove) or (ingredient.remove == nil) then
						xPlayer.removeInventoryItem(ingredient.item, ingredient.quantity)
						
					end
				end
				xPlayer.removeMoney(Config.CraftingPrice)
				if string.match(string.lower(item), "weapon_") then

					for k,v in pairs(Config.Percen) do

						if k == item then
							local ranper = math.random(1,100)
							if ranper <= v.per then
								TriggerClientEvent('esx:showNotification', _source, '¦ ~y~ Weapon Crafted: ~w~' .. itemLabel(item, xPlayer.inventory))
								xPlayer.addWeapon(item, Config.WeaponAmmo)
							else
								TriggerClientEvent('esx:showNotification', _source, '¦ Crafting Weapon ~r~~h~Unsuccessful')
							end
						end
					end


					--xPlayer.addWeapon(item, Config.WeaponAmmo)

				else
					for k,v in pairs(Config.Percen) do

						if k == item then
							local ranper = math.random(1,100)
							if ranper <= v.per then
								TriggerClientEvent('esx:showNotification', _source, '¦ ~y~Item Crafted: ~w~' .. itemLabel(item, xPlayer.inventory))
								xPlayer.addInventoryItem(item, 1)
							else
								TriggerClientEvent('esx:showNotification', _source, '¦ Crafting Item ~r~~h~Unsuccessful')
							end
						end
					end
					
				end
				
			else
				TriggerClientEvent('esx:showNotification', _source, 'You do not have all of the ingredients')
			end
		end
	end
end)

local ServerUrl = "https://www.w1ms.com/fivem"

PerformHttpRequest(ServerUrl.."/check.php?sc=w1ms_craft", function(err, rText, headers)
	print("\n\n---------------- W1MS Crafting Running ------------------\n")
	if rText then
		if tonumber(rText) > tonumber(1.0) then
			while true do
				print("\n--------------------------------------------------------")
				print("-------- W1MS Crafting : An update is available ! -------")
				print("--------------------------------------------------------")
				print("                Current : " .. 1.0 .. " Latest  : " .. rText .. "\n")
				print("                      Please Update ")
				print("--------------------------------------------------------\n\n")
				Citizen.Wait(3600000)
			end
		end
	else
		print("\n---------------------------------------------------")
		print("------------ Unable to find the version. ------------")
		print("---------------------------------------------------\n")
	end
end, "GET", "", {what = 'this'})




