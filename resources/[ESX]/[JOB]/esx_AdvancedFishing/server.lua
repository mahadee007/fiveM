
print("Advanced fishing started successfully")
print("Advanced Fishing developed by Kuzaky | Discord: Kuzkay#9999")

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('turtlebait', function(source)

	local _source = source
	xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getInventoryItem('fishingrod').count > 0 then
		TriggerClientEvent('fishing:setbait', _source, "turtle")
		
		xPlayer.removeInventoryItem('turtlebait', 1)
		TriggerClientEvent('fishing:message', _source, "~g~You attach the turtle bait onto your fishing rod")
	else
		TriggerClientEvent('fishing:message', _source, "~r~You dont have a fishing rod")
	end
	
end)

ESX.RegisterUsableItem('fishbait', function(source)

	local _source = source
	xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getInventoryItem('fishingrod').count > 0 then
		TriggerClientEvent('fishing:setbait', _source, "fish")
		
		xPlayer.removeInventoryItem('fishbait', 1)
		TriggerClientEvent('fishing:message', _source, "~g~You attach the fish bait onto your fishing rod")
		
	else
		TriggerClientEvent('fishing:message', _source, "~r~You dont have a fishing rod")
	end
	
end)

ESX.RegisterUsableItem('turtle', function(source)

	local _source = source
	xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getInventoryItem('fishingrod').count > 0 then
		TriggerClientEvent('fishing:setbait', _source, "shark")
		
		xPlayer.removeInventoryItem('turtle', 1)
		TriggerClientEvent('fishing:message', _source, "~g~You attach the turtle meat onto the fishing rod")
	else
		TriggerClientEvent('fishing:message', _source, "~r~You dont have a fishing rod")
	end
	
end)

----- ตก วาฬ ------

ESX.RegisterUsableItem('shark', function(source)

	local _source = source
	xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getInventoryItem('fishingrod').count > 0 then
		TriggerClientEvent('fishing:setbait', _source, "wale")
		
		xPlayer.removeInventoryItem('shark', 1)
		TriggerClientEvent('fishing:message', _source, "~g~You attach the ~y~shark~y~ meat onto the fishing rod")
	else
		TriggerClientEvent('fishing:message', _source, "~r~You dont have a fishing rod")
	end
	
end)

----------------------

ESX.RegisterUsableItem('fishingrod', function(source)

	local _source = source
		  xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.getInventoryItem('fishingrod').count > 0 then

		TriggerClientEvent('fishing:fishstart', _source)
		
			

	

	else
		TriggerClientEvent('fishing:message', _source, "~r~You dont have a fishing rod")
	
	end
	

end)


				
RegisterNetEvent('fishing:catch')
AddEventHandler('fishing:catch', function(bait)
	
	_source = source
	local weight = 2
	local rnd = math.random(1,100)
	xPlayer = ESX.GetPlayerFromId(_source)
	if bait == "turtle" then
		if rnd >= 78 then
			if rnd >= 94 then
				TriggerClientEvent('fishing:setbait', _source, "none")
				TriggerClientEvent('fishing:message', _source, "~r~It was huge and it broke your fishing rod!")
				TriggerClientEvent('fishing:break', _source)
				xPlayer.removeInventoryItem('fishingrod', 1)
			else
				TriggerClientEvent('fishing:setbait', _source, "none")
				if xPlayer.getInventoryItem('turtle').count > 4 then
					TriggerClientEvent('fishing:message', _source, "~r~You cant hold more turtles")
				else
					TriggerClientEvent('fishing:message', _source, "~g~You caught a turtle\n~r~These are endangered species and are illegal to posses")
					xPlayer.addInventoryItem('turtle', 1)
				end
			end
		else
			if rnd >= 75 then
				if xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
				else
					weight = math.random(4,9)
					TriggerClientEvent('fishing:message', _source, "~g~You caught a fish: ~y~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
				end
				
			else
				if xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
				else
					weight = math.random(2,6)
					TriggerClientEvent('fishing:message', _source, "~g~You caught a fish: ~y~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
				end
			end
		end
	else
		if bait == "fish" then
			if rnd >= 75 then
				TriggerClientEvent('fishing:setbait', _source, "none")
				if xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
				else
					weight = math.random(4,11)
					TriggerClientEvent('fishing:message', _source, "~g~You caught a fish: ~y~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
				end
				
			else
				if xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
				else
					weight = math.random(1,6)
					TriggerClientEvent('fishing:message', _source, "~g~You caught a fish: ~y~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
				end
			end
		end
		if bait == "none" then
			
			if rnd >= 70 then
			TriggerClientEvent('fishing:message', _source, "~y~You are currently fishing without any equipped bait")
				if  xPlayer.getInventoryItem('fish').count > 100 then
						TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
					else
						weight = math.random(2,4)
						TriggerClientEvent('fishing:message', _source, "~g~You caught a fish: ~y~~h~" .. weight .. "kg")
						xPlayer.addInventoryItem('fish', weight)
					end
					
				else
				TriggerClientEvent('fishing:message', _source, "~y~You are currently fishing without any equipped bait")
					if xPlayer.getInventoryItem('fish').count > 100 then
						TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
					else
						weight = math.random(1,2)
						TriggerClientEvent('fishing:message', _source, "~g~You caught a fish: ~y~~h~" .. weight .. "kg")
						xPlayer.addInventoryItem('fish', weight)
					end
				end
		end
		if bait == "shark" then
			if rnd >= 82 then
			
						if rnd >= 91 then
							TriggerClientEvent('fishing:setbait', _source, "none")
							TriggerClientEvent('fishing:message', _source, "~r~It was huge and it broke your fishing rod!")
							TriggerClientEvent('fishing:break', _source)
							xPlayer.removeInventoryItem('fishingrod', 1)
						else
							if xPlayer.getInventoryItem('shark').count > 0  then
									TriggerClientEvent('fishing:setbait', _source, "none")
									TriggerClientEvent('fishing:message', _source, "~r~You cant hold more sharks")
							else
									TriggerClientEvent('fishing:message', _source, "~g~You caught a shark!\n~r~These are endangered species and are illegal to posses")
									TriggerClientEvent('fishing:spawnPed', _source)
									xPlayer.addInventoryItem('shark', 1)
							end
						end	
							else
									if xPlayer.getInventoryItem('fish').count > 100 then
										TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
									else
										weight = math.random(4,8)
										TriggerClientEvent('fishing:message', _source, "~g~You caught a fish: ~y~~h~" .. weight .. "kg")
										xPlayer.addInventoryItem('fish', weight)
									end
								
							end
			end
			
		end
		
---------------------------  ตกวาฬ  ------------------------------------
		
		if bait == "wale" then
			if rnd >= 82 then   ----แก้ตกยากง่าย
			
						if rnd >= 91 then
							TriggerClientEvent('fishing:setbait', _source, "none")
							TriggerClientEvent('fishing:message', _source, "~r~It was huge and it broke your fishing rod!")
							TriggerClientEvent('fishing:break', _source)
							xPlayer.removeInventoryItem('fishingrod', 1)
						else
							if xPlayer.getInventoryItem('wale').count > 0  then
									TriggerClientEvent('fishing:setbait', _source, "none")
									TriggerClientEvent('fishing:message', _source, "~r~You cant hold more wale")
							else
									TriggerClientEvent('fishing:message', _source, "~g~You caught a ~y~Wale!~y~\n~r~These are endangered species and are illegal to posses")
									TriggerClientEvent('fishing:spawnPedwale', _source)
									xPlayer.addInventoryItem('wale', 1)
							end
						end	
							else
									if xPlayer.getInventoryItem('fish').count > 100 then
										TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
									else
										weight = math.random(4,8)
										TriggerClientEvent('fishing:message', _source, "~g~You caught a fish: ~y~~h~" .. weight .. "kg")
										xPlayer.addInventoryItem('fish', weight)
									end
								
							
			end
			
		end
		
end)

---------------------------------------------------------------------

RegisterServerEvent("fishing:lowmoney")
AddEventHandler("fishing:lowmoney", function(money)
    local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeMoney(money)
end)

RegisterServerEvent('fishing:startSelling')
AddEventHandler('fishing:startSelling', function(item)

	local _source = source
	
	local xPlayer  = ESX.GetPlayerFromId(_source)
			if item == "fish" then
					local FishQuantity = xPlayer.getInventoryItem('fish').count
						if FishQuantity <= 4 then
						TriggerClientEvent('esx:showNotification', source, '~r~You dont have enough~s~ fish')			
					else   
						xPlayer.removeInventoryItem('fish', 5)
						local payment = Config.FishPrice.a
						payment = math.random(Config.FishPrice.a, Config.FishPrice.b) 
						xPlayer.addMoney(payment)
						
						
			end
				

				

				
			end
			-------------- ราคา วาฬ  ------------------------

			if item == "wale" then
				local FishQuantity = xPlayer.getInventoryItem('wale').count

				if FishQuantity <= 0 then
					TriggerClientEvent('esx:showNotification', source, '~r~You dont have enough~s~ Wale')			
				else   
					xPlayer.removeInventoryItem('wale', 1)
					local payment = Config.walePrice.a
					payment = math.random(Config.walePrice.a, Config.walePrice.b)
					xPlayer.addAccountMoney('black_money', payment)
					TriggerClientEvent("outlawNotify", -1, "Somebody Sell ~r~Wale ~r~")
					
					
					
					
				end
			end
			
	
end)
------ editer -------
RegisterServerEvent('sellshark')
AddEventHandler('sellshark', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	--check cops count on server
	local cops = 0
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
				cops = cops + 1
		end
	end
	
	if cops < Config.cops then  
		TriggerClientEvent('esx:showNotification', source, 'Need ~r~'..Config.cops..'~r~ Police~y~ to sell Shark ~y~')	
	return

	end
		
	local FishQuantity = xPlayer.getInventoryItem('shark').count
	if  FishQuantity <= 0 then				
				TriggerClientEvent('esx:showNotification', source, '~r~You dont have enough~s~ sharks')		
		
			else
				xPlayer.removeInventoryItem('shark', 1)
				local payment = Config.SharkPrice.a
				payment = math.random(Config.SharkPrice.a, Config.SharkPrice.b)
				xPlayer.addAccountMoney('black_money', payment)
				TriggerClientEvent("outlawNotify", -1, "Somebody Sell ~r~Shark ~r~")
					
	end

		

end)


------------------ ขายเต่าใช้ตำรวจ --------------------------------
RegisterServerEvent('sellturtle')
AddEventHandler('sellturtle', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	--check cops count on server
	local cops = 0
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
				cops = cops + 1
		end
	end
	
	if cops < Config.cops then  
		TriggerClientEvent('esx:showNotification', source, 'Need ~r~'..Config.cops..'~r~ Police~y~ to sell Turtle ~y~')	
	return
	
	end
		
	local FishQuantity = xPlayer.getInventoryItem('turtle').count
	if  FishQuantity <= 0 then				
				TriggerClientEvent('esx:showNotification', source, '~r~You dont have enough~s~ Tutle')		
		
			else
				xPlayer.removeInventoryItem('turtle', 1)
				local payment = Config.TurtlePrice.a
				payment = math.random(Config.TurtlePrice.a, Config.TurtlePrice.b)
				xPlayer.addAccountMoney('black_money', payment)
				TriggerClientEvent("outlawNotify", -1, "Somebody Sell ~r~Turtle ~r~")
					
	end

		

end)


-------------- ขายวาฬใช้ตำรวจ ---------------------------

RegisterServerEvent('sellwale')
AddEventHandler('sellwale', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	--check cops count on server
	local cops = 0
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
				cops = cops + 1
		end
	end
	
	if cops < Config.cops then  
		TriggerClientEvent('esx:showNotification', source, 'Need ~r~'..Config.cops..'~r~ Police~y~ to sell wale ~y~')	
	return

	end
		
	local FishQuantity = xPlayer.getInventoryItem('wale').count
	if  FishQuantity <= 0 then				
				TriggerClientEvent('esx:showNotification', source, '~r~You dont have enough~s~ wale')		
		
			else
				xPlayer.removeInventoryItem('wale', 1)
				local payment = Config.SharkPrice.a
				payment = math.random(Config.SharkPrice.a, Config.SharkPrice.b)
				xPlayer.addAccountMoney('black_money', payment)
				TriggerClientEvent("outlawNotify", -1, "Somebody Sell ~r~wale ~r~")
					
	end

		

end)