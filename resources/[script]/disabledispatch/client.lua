Citizen.CreateThread(function()
	while true do
		Wait(0)
		for i = 1, 12 do
			EnableDispatchService(i, false)
		end
		SetPlayerWantedLevel(PlayerId(), 0, false)
		SetPlayerWantedLevelNow(PlayerId(), false)
		SetPlayerWantedLevelNoDrop(PlayerId(), 0, false)
	end
end)

local dispatchTypes =
{
	DT_PoliceAutomobile = { ID = 1, ACTIVE = false },
	DT_PoliceHelicopter = { ID = 2, ACTIVE = false },
	DT_FireDepartment = { ID = 3, ACTIVE = false },
	DT_SwatAutomobile = { ID = 4, ACTIVE = false },
	DT_AmbulanceDepartment = { ID = 5, ACTIVE = false },
	DT_PoliceRiders = { ID = 6, ACTIVE = false },
	DT_PoliceVehicleRequest = { ID = 7, ACTIVE = false },
	DT_PoliceRoadBlock = { ID = 8, ACTIVE = false},
	DT_PoliceAutomobileWaitPulledOver = { ID = 9, ACTIVE = false },
	DT_PoliceAutomobileWaitCruising = { ID = 10, ACTIVE = false },
	DT_Gangs = { ID = 11, ACTIVE = false },
	DT_SwatHelicopter = { ID = 12, ACTIVE = false },
	DT_PoliceBoat = { ID = 13, ACTIVE = false },
	DT_ArmyVehicle = { ID = 14, ACTIVE = false },
	DT_BikerBackup = { ID = 15, ACTIVE = false }
}

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if NetworkIsPlayerActive(PlayerId()) then
			for k,v in pairs(dispatchTypes) do
				EnableDispatchService(dispatchTypes[k].ID, dispatchTypes[k].ACTIVE)
			end
			SetMaxWantedLevel(0)
			break;
		end
	end
end)
