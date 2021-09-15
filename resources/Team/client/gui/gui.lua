RegisterNetEvent('027e2f1f-770a-488c-a9e9-9430743f1c19')
RegisterNetEvent('40df74aa-40d8-4e90-8387-b02b1261f783')
RegisterNetEvent('1fd7aebd-d6a0-432f-a532-6609c6c2e427')
RegisterNetEvent('59e6ee1c-034d-4b40-9b73-699c88dda0ee')
RegisterNetEvent('4e1c2a99-e415-42d5-bdaa-7c846893bc5d')
rd = false	 -- KEEP THIS FALSE, OTHERWISE DEBUG FEATURES WILL BE ENABLED

curSquadMembers = {}

local playersDB = {}
for i=0, 31 do
	playersDB[i] = {}
end

AddEventHandler('027e2f1f-770a-488c-a9e9-9430743f1c19', function(squadName)
	curSquadMembers = {}
	TriggerEvent('a2a08a39-878c-4b5a-b7e4-78bc0d773e0b', "~g~"..squadName.."~w~ has been created!")
	Citizen.Trace("created new squad\n")
	--table.insert( curSquadMembers,GetPlayerServerId(PlayerId()))
	UpdateSquadMembers()
end)

AddEventHandler('4e1c2a99-e415-42d5-bdaa-7c846893bc5d', function(members,squadName)
	curSquadMembers = {}
	TriggerEvent('a2a08a39-878c-4b5a-b7e4-78bc0d773e0b', "You joined ~g~"..squadName.."~w~!")
	Citizen.Trace("joined a new squad\n")
	for i,theMember in ipairs(members) do
		table.insert(curSquadMembers,theMember.id)
	end
	UpdateSquadMembers()
end)

AddEventHandler('59e6ee1c-034d-4b40-9b73-699c88dda0ee', function(squadName)
	curSquadMembers = {}
	TriggerEvent('a2a08a39-878c-4b5a-b7e4-78bc0d773e0b', "You left ~g~"..squadName.."~w~!")
	Citizen.Trace("we are leaving this squad\n")
	UpdateSquadMembers()
end)

AddEventHandler('1fd7aebd-d6a0-432f-a532-6609c6c2e427', function(memberId,memberName)
	found = false
	for i,theTeammate in ipairs(curSquadMembers) do
		if theTeammate == memberId then
			found = true
			table.remove(curSquadMembers, i)
			TriggerEvent('a2a08a39-878c-4b5a-b7e4-78bc0d773e0b', "~g~"..memberName.."~w~ left your Squad!")
		end
	end
	if not found then Citizen.Trace("squad member left but we couldn't find him in our member list\n") else Citizen.Trace("player left us and was removed\n") end
	UpdateSquadMembers()
end)

AddEventHandler('40df74aa-40d8-4e90-8387-b02b1261f783', function(PlayerName,PlayerId)
	TriggerEvent('a2a08a39-878c-4b5a-b7e4-78bc0d773e0b', "~g~"..PlayerName.."~w~ joined your Squad!")
	Citizen.Trace("someone joined our squad\n")
	table.insert(curSquadMembers, PlayerId)
	UpdateSquadMembers()
end)

Citizen.CreateThread(function()
	function UpdateSquadMembers()
		ptable = GetPlayers()
		for id, Player in ipairs(ptable) do
			isTeamMate = false
			for i,theTeammate in ipairs(curSquadMembers) do
				if Player == GetPlayerFromServerId(theTeammate) then
					if playersDB[Player].blip then RemoveBlip(playersDB[Player].blip) end
					isTeamMate = true
					local ped = GetPlayerPed(GetPlayerFromServerId(theTeammate))
					local blip = AddBlipForEntity(ped)
					SetBlipSprite(blip, 1)
					Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
					SetBlipNameToPlayerName(blip, Player)
					-- SetBlipScale(blip, 0.80)
					playersDB[Player].blip = blip
				end
			end
			if isTeamMate == false then
				if playersDB[Player].blip then
					RemoveBlip(playersDB[Player].blip)
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		for i,Player in ipairs(playersDB) do
			for id,theTeammate in ipairs(curSquadMembers) do
				if Player == GetPlayerFromServerId(theTeammate) then
					local veh = GetVehiclePedIsIn(playersDB[Player].ped, false)
					if playersDB[Player].ped ~= GetPlayerPed(playersDB[Player]) then
						RemoveBlip(RemoveBlip(playersDB[Player].blip))
						local ped = GetPlayerPed(GetPlayerFromServerId(theTeammate))
						local blip = AddBlipForEntity(ped)
						SetBlipSprite(blip, 1)
						Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
						SetBlipNameToPlayerName(blip, Player)
						-- SetBlipScale(blip, 0.8)
						playersDB[Player].blip = blip
					end
					local blip = playersDB[Player].blip
					local blipSprite = GetBlipSprite(blip)
					if IsPedInAnyVehicle(playersDB[Player].ped, true) then
						local sprite = GetVehicleSpriteId(veh)

						if blipSprite ~= sprite then
							SetBlipSprite(blip, sprite)
							Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
						end
					else
						if blipSprite ~= 1 then
							SetBlipSprite(blip, 1)
							Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
						end
					end
				end
			end
		end
	end
end)

Citizen.CreateThread( function()
	while true do
		if FreezeEngine then
			SetVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId(), false),false,true,false)
		end
		Citizen.Wait(0)
	end
end)

function GetVehicleSpriteId(veh)
	vehClass = GetVehicleClass(veh)
	vehModel = GetEntityModel(veh)
	local sprite = 1

	if(vehClass == 8 or vehClass == 13)then
		sprite = 226 -- Bikes
	elseif(vehClass == 14)then
		sprite = 427 -- Boat
	elseif(vehClass == 15)then
		sprite = 422 -- Jet
	elseif(vehClass == 16)then
		sprite = 423 -- Planes
	elseif(vehClass == 19)then
		sprite = 421 -- Military
	else
		sprite = 225 -- Car
	end

	-- Model Specific Icons override Class.
	if(vehModel == GetHashKey("besra") or vehModel == GetHashKey("hydra") or vehModel == GetHashKey("lazer"))then
		sprite = 424
	elseif(vehModel == GetHashKey("insurgent") or vehModel == GetHashKey("insurgent2") or vehModel == GetHashKey("limo2"))then
		sprite = 426
	elseif(vehModel == GetHashKey("rhino"))then
		sprite = 421
	end

	return sprite
end

function GetPlayers()
	local players = {}

	for i = 0, 31 do
		if NetworkIsPlayerActive(i) then
			table.insert(players, i)
		end
	end
	return players
end


Citizen.CreateThread(function()

	TeamMenu.CreateMenu('squad', 'Team Menu')

	while true do
		if TeamMenu.IsMenuOpened('squad') then
			if TeamMenu.Button('Join Team') then
				DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP12N", "", "", "", "", "", 128 + 1)

				while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
					Citizen.Wait( 0 )
				end

				local result = GetOnscreenKeyboardResult()

				if result then
					TriggerServerEvent('1adf358a-8f69-4a9e-9974-45c0af86f733', result, GetPlayerName(PlayerId()))
				end

			elseif TeamMenu.Button('Leave Team') then
				TriggerServerEvent('4d9024b3-253f-4d79-9a17-9092dd999af2', GetPlayerName(PlayerId()))
			end
			TeamMenu.Display()
		elseif IsControlJustReleased(0, 82) then --M by default
				TeamMenu.OpenMenu('squad')
		end
		Citizen.Wait(0)
	end
end)