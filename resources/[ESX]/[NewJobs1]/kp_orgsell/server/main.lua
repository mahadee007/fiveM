local ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) 
    ESX = obj 
end)

RegisterServerEvent("kp_org2:sellBottles")
AddEventHandler("kp_org2:sellBottles", function()
    local player = ESX.GetPlayerFromId(source)

    local currentBottles = player.getInventoryItem("org_a")["count"]
    
    if currentBottles > 0 then
        math.randomseed(os.time())
        local randomMoney = math.random((Config.BottleReward[49] or 50), (Config.BottleReward[49] or 50))

        player.removeInventoryItem("org_a", currentBottles)
        player.addMoney(randomMoney * currentBottles)

        TriggerClientEvent("esx:showNotification", source, ("You gave the store %s orange and got paid $%s."):format(currentBottles, currentBottles * randomMoney))
    else
        TriggerClientEvent("esx:showNotification", source, "You don't have any orange to give the store.")
    end
end)


RegisterServerEvent("kp_org2:retrieveBottle")
AddEventHandler("kp_org2:retrieveBottle", function()
    local player = ESX.GetPlayerFromId(source)

    math.randomseed(os.time())
    local luck = math.random(0, 69)
    local randomBottle = math.random((Config.BottleRecieve[2] or 3), (Config.BottleRecieve[4] or 7))

    if luck >= 0 and luck <= 29 then
        TriggerClientEvent("esx:showNotification", source, "Tree do not have ~o~oranges ~w~in it")
    else
        player.addInventoryItem("org_a", randomBottle)
        TriggerClientEvent("esx:showNotification", source, ("You found x%s ~o~Orange"):format(randomBottle))
    end
end)
