local spawnedMeth = 0
local methPlants = {}
local isPickingUp, isProcessing = false, false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords = GetEntityCoords(PlayerPedId())
		
		if GetDistanceBetweenCoords(coords, Config.CircleZones.MethField.coords, true) < 50 then
			SpawnMeth()
			Citizen.Wait(500)
		else
			Citizen.Wait(500)
		end
	end
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, Config.CircleZones.MethProcessing.coords, true) < 5 then --Distance Process Zone
			--[[if not isProcessing then
				ESX.ShowHelpNotification(_U('meth_processprompt'))
			end]]--
			
			DisplayHelpText('Press [~g~E~s~] to Processing the ~b~ Meth~s~')
			--if IsControlJustReleased(0, Keys['E']) and not isProcessing then
			if IsControlJustReleased(0, 38) and not isProcessing then

				if Config.LicenseEnable then
					ESX.TriggerServerCallback('esx_license:checkLicense', function(hasProcessingLicense)
						if hasProcessingLicense then
							ProcessMeth()
						else
							OpenBuyLicenseMenu('meth_processing')
						end
					end, GetPlayerServerId(PlayerId()), 'meth_processing')
				else
					ProcessMeth()
				end

			end
		else
			Citizen.Wait(500)
		end
	end
end)

function ProcessMeth()
	isProcessing = true

	ESX.ShowNotification(_U('meth_processingstarted'))
	TriggerServerEvent('holfz_meth:processMeth')
	local timeLeft = Config.Delays.MethProcessing / 1000
	local playerPed = PlayerPedId()

	while timeLeft > 0 do
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1

		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.MethProcessing.coords, false) > 4 then
			ESX.ShowNotification(_U('meth_processingtoofar'))
			TriggerServerEvent('holfz_meth:cancelProcessing')
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

		for i=1, #methPlants, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(methPlants[i]), false) < 1 then
				nearbyObject, nearbyID = methPlants[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then

			--[[if not isPickingUp then
				ESX.ShowHelpNotification(_U('meth_pickupprompt'))
			end]]--
			
			DisplayHelpText('Press [~g~E~s~] to PickingUp the ~b~ Meth~s~')
			--if IsControlJustReleased(0, Keys['E']) and not isPickingUp then
			if IsControlJustReleased(0, 38) and not isPickingUp then
				isPickingUp = true

				ESX.TriggerServerCallback('holfz_meth:canPickUp', function(canPickUp)

					if canPickUp then
						TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_KNEEL', 0, false)
						exports['progressBars']:startUI(10000, "💊 กำลังเก็บส่วนผสมยาบ้า..")
						Citizen.Wait(10000)
						--Citizen.Wait(5000)
						ClearPedTasks(playerPed)
						Citizen.Wait(1000)
		
						ESX.Game.DeleteObject(nearbyObject)
		
						table.remove(methPlants, nearbyID)
						spawnedMeth = spawnedMeth - 1
		
						TriggerServerEvent('holfz_meth:pickedUpMeth')
					else
						ESX.ShowNotification(_U('meth_inventoryfull'))
					end

					isPickingUp = false

				end, 'meth')
			end

		else
			Citizen.Wait(500)
		end

	end

end)

AddEventHandler('holfz_meth:onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(methPlants) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnMeth()
	while spawnedMeth < 25 do
		Citizen.Wait(0)
		local methCoords = GenerateMethCoords()
		
		ESX.Game.SpawnLocalObject('hei_prop_hei_drug_pack_02', methCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(methPlants, obj)
			spawnedMeth = spawnedMeth + 1
		end)
	end
end

function ValidateMethCoord(plantCoord)
	if spawnedMeth > 0 then
		local validate = true

		for k, v in pairs(methPlants) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.MethField.coords, false) > 50 then
			validate = false
		end
		
		return validate
	else
		return true
	end
end

function GenerateMethCoords()
	while true do
		Citizen.Wait(1)

		local methCoordX, methCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-10, 10) --Distance Meth Zone

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-10, 10) --Distance Meth Zone

		methCoordX = Config.CircleZones.MethField.coords.x + modX
		methCoordY = Config.CircleZones.MethField.coords.y + modY

		local coordZ = GetCoordZ(methCoordX, methCoordY)
		local coord = vector3(methCoordX, methCoordY, coordZ)

		if ValidateMethCoord(coord) then
			return coord
		end
	end
end

function GetCoordZ(x, y)
	local groundCheckHeights = { 40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0, 50.0  }
	
	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)
		if foundGround then
			return z
		end
	end
	
	return 74.67
end