
local spawnedStone = 0
local MineStone = {}
local isPickingUp, isProcessing = false, false


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, Config.CircleZones.StoneField.coords, true) < 50 then
			SpawnStones()
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

		for i=1, #MineStone, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(MineStone[i]), false) < 1 then
				nearbyObject, nearbyID = MineStone[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then

			if not isPickingUp then
				ESX.ShowHelpNotification(_U('stone_pickupprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isPickingUp then
				isPickingUp = true

				ESX.TriggerServerCallback('hz_miner:canPickUp', function(canPickUp)

					if canPickUp then
						TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_CONST_DRILL', 0, false)

						Citizen.Wait(10000)
					--	Citizen.Wait(2000)
						ClearPedTasks(playerPed)
						Citizen.Wait(1500)
		
						ESX.Game.DeleteObject(nearbyObject)
		
						table.remove(MineStone, nearbyID)
						spawnedStone = spawnedStone - 1
		
						TriggerServerEvent('hz_miner:pickedUpStones')
					else
						ESX.ShowNotification(_U('stone_inventoryfull'))
					end

					isPickingUp = false

				end, 'stone')
			end

		else
			Citizen.Wait(500)
		end

	end

end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(MineStone) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnStones()
	while spawnedStone < 25 do
		Citizen.Wait(0)
		local stoneCoords = GenerateStoneCoords()

		ESX.Game.SpawnLocalObject('prop_rock_1_d', stoneCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(MineStone, obj)
			spawnedStone = spawnedStone + 1
		end)
	end
end

function ValidateStoneCoord(plantCoord)
	if spawnedStone > 0 then
		local validate = true

		for k, v in pairs(MineStone) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.StoneField.coords, false) > 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GenerateStoneCoords()
	while true do
		Citizen.Wait(1)

		local stoneCoordX, stoneCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-90, 90)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-90, 90)

		stoneCoordX = Config.CircleZones.StoneField.coords.x + modX
		stoneCoordY= Config.CircleZones.StoneField.coords.y + modY

		local coordZ = GetCoordZ(stoneCoordX, stoneCoordY)
		local coord = vector3(stoneCoordX, stoneCoordY, coordZ)

		if ValidateStoneCoord(coord) then
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