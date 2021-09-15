-- [[ Some Prefernce Shit ]] --
local tazerName = "WEAPON_STUNGUN"
local pistolName = "WEAPON_COMBATPISTOL"
local disablePistolWhip = false

-- [[ Main Loop ]] --
Citizen.CreateThread( function()
	while true do
		if IsControlPressed( 1, 38 ) then
			weaSwitch()
		end
		Citizen.Wait(5)
		if disablePistolWhip then 
			DisableControlAction(0, 140, true) -- Disables pistol whip when you press R
		end
	end
end)

-- [[ Function For Switching ]] --
function weaSwitch()
	local ped = GetPlayerPed(-1)

	local currentWeaponHash = GetSelectedPedWeapon(ped)
	local tazerHash = GetHashKey(tazerName)
	local gotTazer = HasPedGotWeapon(ped, tazerHash, false)
	local gotPistol = HasPedGotWeapon(ped, GetHashKey(pistolName), false)

	if gotTazer and gotPistol then
		if currentWeaponHash == tazerHash then
			SetPedDropsWeapon(ped)
			Citizen.Wait(450)
			loadAnimDict( "rcmjosh4" )
			loadAnimDict( "weapons@pistol@" )
			TaskPlayAnim(ped, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
			SetCurrentPedWeapon(ped, GetHashKey(pistolName), true)
			Citizen.Wait(600)
			ClearPedTasks(ped)
		end
	end
end

-- [[ Only Added For Some Debug But Meh ]] --
function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(true, false)
end

-- [[ Used To Load Animations ]] --
function loadAnimDict( dict )
	while ( not HasAnimDictLoaded( dict ) ) do
		RequestAnimDict( dict )
		Citizen.Wait( 0 )
	end
end

--[[ ISSUES ]--
- Weapon reloads after weapon switched

--[ ISSUES ]]--