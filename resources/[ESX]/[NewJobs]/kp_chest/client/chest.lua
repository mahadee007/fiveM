local spawnedChest = 0
local chestss = {}


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, Config.CircleZones.ChestField.coords, true) < 15 then
			SpawnChestts()
			Citizen.Wait(1)
		else
			Citizen.Wait(1)
		end
	end
end)


function SpawnChestts()
	while spawnedChest < 10 do
		Citizen.Wait(0)
		local chestCoords = GenerateChestCoords()

		ESX.Game.SpawnLocalObject('prop_box_wood02a_pu', chestCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(chestss, obj)
			spawnedChest = spawnedChest + 1
		end)
	end
end

function ValidateChestCoord(plantCoord)
	if spawnedChest > 0 then
		local validate = true

		for k, v in pairs(chestss) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 7 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.ChestField.coords, false) > 15 then
			validate = false
		end

		return validate
	else
		return true
	end
end



function GenerateChestCoords()
	while true do
		Citizen.Wait(5)

		local chestCoordX, chestCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-25, 20)

		Citizen.Wait(5)

		math.randomseed(GetGameTimer())
		local modY = math.random(-20, 25)

		chestCoordX = Config.CircleZones.ChestField.coords.x + modX
		chestCoordY = Config.CircleZones.ChestField.coords.y + modY

		local coordZ = GetCoordZ(chestCoordX, chestCoordY)
		local coord = vector3(chestCoordX, chestCoordY, coordZ)

		if ValidateChestCoord(coord) then
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
