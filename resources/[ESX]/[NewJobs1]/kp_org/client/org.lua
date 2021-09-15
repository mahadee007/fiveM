local spawnedOrg = 0
local orgss = {}

---------------------

local spawnedOrg2 = 0
local orgss2 = {}

--------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, Config.CircleZones.OrgField.coords, true) < 50 then
			SpawnOrggs()
			Citizen.Wait(100)
		else
			Citizen.Wait(100)
		end
	end
end)


function SpawnOrggs()
	while spawnedOrg < 30 do
		Citizen.Wait(5000)
		local pineCoords = GeneratePineCoords()

		ESX.Game.SpawnLocalObject('prop_tree_birch_05', pineCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(orgss, obj)
			spawnedOrg = spawnedOrg + 1
		end)
	end
end

function ValidateOrgCoord(plantCoord)
	if spawnedOrg > 0 then
		local validate = true

		for k, v in pairs(orgss) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 8 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.OrgField.coords, false) > 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end



function GeneratePineCoords()
	while true do
		Citizen.Wait(5)

		local pineCoordX, pineCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-50, 50)

		Citizen.Wait(5)

		math.randomseed(GetGameTimer())
		local modY = math.random(-50, 50)

		pineCoordX = Config.CircleZones.OrgField.coords.x + modX
		pineCoordY = Config.CircleZones.OrgField.coords.y + modY

		local coordZ = GetCoordZ(pineCoordX, pineCoordY)
		local coord = vector3(pineCoordX, pineCoordY, coordZ)

		if ValidateOrgCoord(coord) then
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
