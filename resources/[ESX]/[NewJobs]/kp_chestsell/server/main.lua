local ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) 
    ESX = obj 
end)

RegisterServerEvent("kp_chest2:sellBottles")
AddEventHandler("kp_chest2:sellBottles", function()
    local player = ESX.GetPlayerFromId(source)

    local currentBottles = player.getInventoryItem("chest_a")["count"]
    
    if currentBottles > 0 then
        math.randomseed(os.time())
        local randomMoney = math.random((Config.BottleReward[100] or 100), (Config.BottleReward[100] or 100))

        player.removeInventoryItem("chest_a", currentBottles)
        player.addMoney(randomMoney * currentBottles)

        TriggerClientEvent("esx:showNotification", source, ("You gave the store %s Golds and got paid $%s."):format(currentBottles, currentBottles * randomMoney))
    else
        TriggerClientEvent("esx:showNotification", source, "You don't have any Golds to give the store.")
    end
end)


RegisterServerEvent("kp_chest2:retrieveBottle")
AddEventHandler("kp_chest2:retrieveBottle", function()
    local player = ESX.GetPlayerFromId(source)

    math.randomseed(os.time())
    local luck = math.random(1, 70)
    local randomBottle = math.random((Config.BottleRecieve[5] or 10), (Config.BottleRecieve[11] or 20))

    if luck >= 1 and luck <= 30 then
        TriggerClientEvent("esx:showNotification", source, "Chest do not have ~y~Golds ~w~in it")
    else 
        player.addInventoryItem("chest_a", randomBottle)
        TriggerClientEvent("esx:showNotification", source, ("You found x%s ~y~Golds "):format(randomBottle))
	
    end
end)
