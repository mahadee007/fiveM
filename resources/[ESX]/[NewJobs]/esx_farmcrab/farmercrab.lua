local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local spawnedProps = 0
local Props = {}
local isPickingUp, isProcessing = false, false
local IsRiding = false
local Tractor = false
function Spawn(Pcoords, Pped)	
	ESX.Game.SpawnVehicle(1641462412, Pcoords, 13, function(spawnedVehicle)
		-- save & set plate
		local plate = 'WORK' .. math.random(100, 900)
		SetVehicleNumberPlateText(spawnedVehicle, plate)

		TaskWarpPedIntoVehicle(Pped, spawnedVehicle, -1)
	end)
	--DeleteEntity(HuntBoat)
end
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, config.zones.farm.coords, true) < 50 then
			SpawnProps()
			Citizen.Wait(1000)
		else
			Citizen.Wait(1000)
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
				--ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to ~g~Process")
				DisplayHelpText('Press [~g~E~s~] to Process ~b~ Crab~s~')
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
	
	TriggerServerEvent('esx_farmcrab:process')
	
	local timeLeft = 5000 / 1000
	local playerPed = PlayerPedId()

	while timeLeft > 0 do
	TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, false)
		Citizen.Wait(5000)
		ClearPedTasks(playerPed)
		    break
		timeLeft = timeLeft - 1
		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), config.zones.process.coords, false) > 4 then
			TriggerServerEvent('esx_farmcrab:cancelProcessing')
			
			break
		end
	end

	isProcessing = false
end

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
		local nearbyObject, nearbyID
		local veh = GetVehiclePedIsIn(playerPed)
		for i=1, #Props, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(Props[i]), false) < 3 then
				nearbyObject, nearbyID = Props[i], i
			end
		end

		--if nearbyObject then
		if nearbyObject and IsPedOnFoot(playerPed) then
					--if not isPickingUp and GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "TRACTOR" then
						--ESX.ShowHelpNotification("Press ~INPUT_THROW_GRENADE~ to ~g~Harvest")
						DisplayHelpText('Press [~g~E~s~] to harvest the ~b~ Crab~s~')
					--end

					if IsControlJustReleased(0, 38) and not isPickingUp then
					--if IsControlJustReleased(0, 38) and not isPickingUp and GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "TRACTOR" then
						ESX.TriggerServerCallback('esx_farmcrab:haveItem', function(haveItem)
							if haveItem then
								isPickingUp = true
						
									ESX.TriggerServerCallback('esx_farmcrab:canPickUp', function(canPickUp)
											
											if canPickUp then												
												--TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_KNEEL', 0, false)
												TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_GARDENER_PLANT', 0, false)
												--TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_KNEEL', 0, false)
						TriggerEvent("mythic_progbar:client:progress", {
						 
							name = "unique_action_name",
							duration = 7500,
							label = "🦀 กำลังขุดปู",
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
											
											Citizen.Wait(5000)
											ClearPedTasks(playerPed)
											Citizen.Wait(100)
							
											ESX.Game.DeleteObject(nearbyObject)
							
											table.remove(Props, nearbyID)
											spawnedProps = spawnedProps - 1
							
											TriggerServerEvent('esx_farmcrab:pickedUp')
											else
												ESX.ShowNotification("InventoryFull !!!!")

											end

											isPickingUp = false
										
									end, 'crab')
							else
								ESX.ShowNotification("You need to buy Sicklecrab")
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
		Citizen.Wait(5000)
		local Coords = GeneratePropCoords()

			ESX.Game.SpawnLocalObject('prop_beach_sandcas_01', Coords, function(obj)
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

		if GetDistanceBetweenCoords(Coord, config.zones.farm.coords, false) > 50 then
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
		local modX = math.random(-20, 20)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-20, 20)

		CoordX = config.zones.farm.coords.x + modX
		CoordY = config.zones.farm.coords.y + modY

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