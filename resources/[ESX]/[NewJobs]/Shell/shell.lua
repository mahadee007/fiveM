local spawnedProps = 0
local Props = {}
local isPickingUp, isProcessing = false, false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, config.zones.shell.coords, true) < 50 then
			SpawnProps()
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

		if GetDistanceBetweenCoords(coords, config.zones.process.coords, true) < 1 then
			if not isProcessing then
				ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to ~g~Process")
			end

			if IsControlJustReleased(0, 38) and not isProcessing then
					Process()
			end
		else
			Citizen.Wait(500)
		end
	end
end)

function Process()
	isProcessing = true

	TriggerServerEvent('BombGoodMan_shell:process')
	local timeLeft = 4500 / 1000
	local playerPed = PlayerPedId()
    exports['progressBars']:startUI(4500, "กำลังลวกหอย")
	while timeLeft > 0 do
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1
		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), config.zones.process.coords, false) > 4 then
			TriggerServerEvent('BombGoodMan_shell:cancelProcessing')
			break
		end
	end

	isProcessing = false
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local nearbyObject, nearbyID

		for i=1, #Props, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(Props[i]), false) < 2 then
				nearbyObject, nearbyID = Props[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then
			
					if not isPickingUp then
						ESX.ShowHelpNotification("Press ~INPUT_PICKUP~ to ~g~Dig")
					end

					if IsControlJustReleased(0, 38) and not isPickingUp then
						ESX.TriggerServerCallback('BombGoodMan_shell:haveItem', function(haveItem)
							if haveItem then
								isPickingUp = true

								ESX.TriggerServerCallback('BombGoodMan_shell:canPickUp', function(canPickUp)
										
										if canPickUp then
											TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
						TriggerEvent("mythic_progbar:client:progress", {
						 
							name = "unique_action_name",
							duration = 7500,
							label = "กำลังเก็บหอย",
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
							
											table.remove(Props, nearbyID)
											spawnedProps = spawnedProps - 1
							
											TriggerServerEvent('BombGoodMan_shell:pickedUp')
											else
												ESX.ShowNotification("InventoryFull !!!!")

											end

											isPickingUp = false
										
									end, 'shell')
							else
								ESX.ShowNotification("You need to buy shovel")
							end
						
						end)
					end
				
		else
			Citizen.Wait(500)
		end

	end

end)


AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(Props) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnProps()
	while spawnedProps < 25 do
		Citizen.Wait(0)
		local Coords = GeneratePropCoords()

		ESX.Game.SpawnLocalObject('prop_rock_5_e', Coords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)
			
			table.insert(Props, obj)
			spawnedProps = spawnedProps + 1
		end)
	end
end

function ValidateCoord(Coord)
	if spawnedProps > 0 then
		local validate = true

		for k, v in pairs(Props) do
			if GetDistanceBetweenCoords(Coord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(Coord, config.zones.shell.coords, false) > 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GeneratePropCoords()
	while true do
		Citizen.Wait(1)

		local CoordX, CoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-50, 50)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-50, 50)

		CoordX = config.zones.shell.coords.x + modX
		CoordY = config.zones.shell.coords.y + modY

		local coordZ = GetCoordZ(CoordX, CoordY)
		local coord = vector3(CoordX, CoordY, coordZ)

		if ValidateCoord(coord) then
			return coord
		end
	end
end

function GetCoordZ(x, y)
	local groundCheckHeights = { 40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0, 50.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 43.0
end