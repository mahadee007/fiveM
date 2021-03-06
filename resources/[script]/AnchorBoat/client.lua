--[[ 
	AnchorBoat
    Copyright (C) 2018  Thaisen
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.
    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 ]]

local anchored = false
local boat = nil
Citizen.CreateThread(function()
	while true do

		Wait(0)
		local ped = GetPlayerPed(-1)
		if IsPedInAnyBoat(ped) then
		boat  = GetVehiclePedIsIn(ped, true)
		end
		if IsControlJustPressed(1, 83) and not IsPedInAnyVehicle(ped) and boat ~= nil then
			if not anchored then
				SetBoatAnchor(boat, true)
				TaskStartScenarioInPlace(ped, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
				Citizen.Wait(10000)
				TriggerEvent("pNotify:SendNotification",{
				text = "ทอดสมอแล้ว!",
				type = "success",
				timeout = (3000),
				layout = "bottomCenter",
				queue = "global",
				animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},
				killer = true,
				sounds = {
				sources = {"Anchordown.ogg"}, -- For sounds to work, you place your sound in the html folder and then add it to the files array in the __resource.lua file.
				volume = 0.1,
				conditions = {"docVisible"}  
				}  
				})
				ClearPedTasks(ped)
			else
				TaskStartScenarioInPlace(ped, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
				Citizen.Wait(10000)
				SetBoatAnchor(boat, false)
				TriggerEvent("pNotify:SendNotification",{
				text = "เก็บสมอเรือ",
				type = "success",
				timeout = (3000),
				layout = "bottomCenter",
				queue = "global",
				animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},
				killer = true,
				sounds = {
				sources = {"Anchorup.ogg"}, -- For sounds to work, you place your sound in the html folder and then add it to the files array in the __resource.lua file.
				volume = 0.1,
				conditions = {"docVisible"}  
				}  
				})
				ClearPedTasks(ped)
			end
			anchored = not anchored
		end
				if IsVehicleEngineOn(boat) then
			anchored = false
		end
	end
end)
