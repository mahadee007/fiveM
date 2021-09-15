local spawnedPines = 0
local piness = {}
local isPickingUp, isProcessing = false, false


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, Config.CircleZones.PineField.coords, true) < 20 then
			SpawnPinees()
			Citizen.Wait(500)
		else
			Citizen.Wait(500)
		end
	end
end)



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local nearbyObject, nearbyID

		for i=1, #piness, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(piness[i]), false) < 2 then
				nearbyObject, nearbyID = piness[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then

			if not isPickingUp then
				ESX.ShowHelpNotification(_U('weed_pickupprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isPickingUp then
				isPickingUp = true

				ESX.TriggerServerCallback('tour_tree:canPickUp', function(canPickUp)

					if canPickUp then
						TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_HAMMERING', 0, false)
						--
						 TriggerEvent("mythic_progbar:client:progress", {
						 
							name = "unique_action_name",
							duration = 7500,
							label = "กำลังตัดไม้ทำด้ามปืน....",
							useWhileDead = false,
							canCancel = true,
							controlDisables = {
								disableMovement = true,
								disableCarMovement = true,
								disableMouse = false,
								disableCombat = true,
								},
								
							}, function(status)
								if not status then
									-- Do Something If Event Wasn't Cancelled
								end
						end)
						--	
						Citizen.Wait(6500)
						ClearPedTasks(playerPed)
						Citizen.Wait(500)
		
						ESX.Game.DeleteObject(nearbyObject)
		
						table.remove(piness, nearbyID)
						spawnedPines = spawnedPines - 1
		
						TriggerServerEvent('tour_tree:pickedUpCannabis')
					else
						ESX.ShowNotification(_U('weed_inventoryfull'))
					end

					isPickingUp = false

				end, 'leather_gun')
			end

		else
			Citizen.Wait(500)
		end

	end

end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(piness) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnPinees()
	while spawnedPines < 20 do
		Citizen.Wait(1)
		local pineCoords = GeneratePineCoords()

		ESX.Game.SpawnLocalObject('prop_tree_fallen_01', pineCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(piness, obj)
			spawnedPines = spawnedPines + 1
		end)
	end
end

function ValidatePineCoord(plantCoord)
	if spawnedPines > 0 then
		local validate = true

		for k, v in pairs(piness) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 10 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.PineField.coords, false) > 20 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GeneratePineCoords()
	while true do
		Citizen.Wait(600)

		local pineCoordX, pineCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-10, 50)

		Citizen.Wait(600)

		math.randomseed(GetGameTimer())
		local modY = math.random(-20, 50)

		pineCoordX = Config.CircleZones.PineField.coords.x + modX
		pineCoordY = Config.CircleZones.PineField.coords.y + modY

		local coordZ = GetCoordZ(pineCoordX, pineCoordY)
		local coord = vector3(pineCoordX, pineCoordY, coordZ)

		if ValidatePineCoord(coord) then
			return coord
		end
	end
end

function GetCoordZ(x, y)
	local groundCheckHeights = { 358.0, 359.0, 360.0, 361.0, 362.0, 363.0, 364.0, 365.0, 366.0, 367.0, 368.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 358.0, 359.0, 360.0, 361.0, 362.0, 363.0, 364.0, 365.0, 366.0, 367.0, 368.0 
end