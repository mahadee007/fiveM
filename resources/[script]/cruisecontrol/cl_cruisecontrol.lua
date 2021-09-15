local enableCruise = false
local speedkm 	   = 0
Citizen.CreateThread( function()
	while true do 
		Citizen.Wait( 0 )   
		local ped = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(ped, false)
		local vehicleModel = GetEntityModel(vehicle)
		local speed = GetEntitySpeed(vehicle)
		local speedkm   = 9999
        local Maxspeed   = speedkm/3.6
		--local Max = GetVehicleMaxSpeed(vehicleModel)
			if ( ped ) then
				if IsControlJustPressed(1, 48) then
					local inVehicle = IsPedSittingInAnyVehicle(ped)
					if (inVehicle) then
						if (GetPedInVehicleSeat(vehicle, -1) == ped) then
						--vehicle = GetVehiclePedIsIn(ped, false)
						--speed = GetEntitySpeed(vehicle)
							if enableCruise == false then
								SetEntityMaxSpeed(vehicle, speed)
							--SetVehicleForwardSpeed(vehicle, speed)
								--TriggerEvent("chatMessage", "[ระบบล็อคความเร็ว: ]", {255, 255, 255}, "ควบคุมความเร็วที่".. math.floor(speed*3.6).."KM/H")
								TriggerEvent("pNotify:SendNotification", {
									text = 'ควบคุมความเร็วที่' .. math.floor(speed*3.6)..'KM/H',
									type = "success",
									timeout = 5000,
									layout = "centerLeft"
								})
								enableCruise = true
							else
							
								SetEntityMaxSpeed(vehicle, Maxspeed)
								--TriggerEvent("chatMessage", "[ระบบล็อคความเร็ว: ]", {255, 255, 255}, "Cruise control DISABLED, MAX speed".. math.floor(Max*3.6).. "km/h")
								TriggerEvent("pNotify:SendNotification", {
									text = 'ยกเลิกความคุมความเร็ว, ที่ความเร็ว' .. math.floor(speed*3.6)..'KM/H',
									type = "error",
									timeout = 5000,
									layout = "centerLeft"
								})
								enableCruise = false
							end
						else
							--TriggerEvent("ChatMessage", "[ระบบล็อคความเร็ว: ]", {255, 255, 255}, "You need to be driving to preform this action" )
							TriggerEvent("pNotify:SendNotification", {
									text = 'คุณต้องขับรถก่อนถึงจะเปิดระบบควบคุมได้',
									type = "error",
									timeout = 5000,
									layout = "centerLeft"
								})
						end
					end
				end
			end
		end
end)