Squads = {}
RegisterServerEvent('1adf358a-8f69-4a9e-9974-45c0af86f733')
RegisterServerEvent('4d9024b3-253f-4d79-9a17-9092dd999af2')

Citizen.CreateThread(function()
	AddEventHandler('1adf358a-8f69-4a9e-9974-45c0af86f733', function(squadName,PlayerName)
	local theSource = source
		if squadName ~= "" then
			squadExists = false
			for i,theSquad in ipairs(Squads) do
				for theRow,theMember in ipairs(theSquad.members) do
					if theMember.name == PlayerName then
						TriggerClientEvent('59e6ee1c-034d-4b40-9b73-699c88dda0ee', theMember.id, Squads[i].name)
						table.remove(Squads[i].members, theRow)
						Citizen.Trace("removed member from old squad\n")
						for ti,TM in ipairs(Squads[i].members) do
							TriggerClientEvent('1fd7aebd-d6a0-432f-a532-6609c6c2e427', TM.id, theMember.id, theMember.name)
							Citizen.Trace("telling members their member left\n")
						end
					end
				end
			end

			for i,theSquad in ipairs(Squads) do
				if theSquad.name == squadName then
					squadExists = true
					table.insert(Squads[i].members, {id = theSource,name = PlayerName, admin = false})
					TriggerClientEvent('4e1c2a99-e415-42d5-bdaa-7c846893bc5d', theSource, Squads[i].members, Squads[i].name)
					Citizen.Trace("player joined new squad\n")
					for i,theMember in ipairs(Squads[i].members) do
						TriggerClientEvent('40df74aa-40d8-4e90-8387-b02b1261f783', theMember.id, PlayerName, theSource)
						Citizen.Trace("telling member they have a new member\n")
					end
				end

				if #theSquad.members == 0 then
					table.remove(Squads, i)
					Citizen.Trace("removed dead squad")
				end
			end
			if squadExists == false then
				local squadtable = {name = squadName, members = { } }
				table.insert(Squads, squadtable)
				TriggerClientEvent('027e2f1f-770a-488c-a9e9-9430743f1c19', theSource, squadName)
				Citizen.Trace("new squad created\n")
				PlayerJoinSquad(theSource, PlayerName, true, squadName)
			end
		end
	end)
	
	AddEventHandler('4d9024b3-253f-4d79-9a17-9092dd999af2', function(PlayerName)
		local theSource = source
		squadExists = false
		for i,theSquad in ipairs(Squads) do
			for theRow,theMember in ipairs(theSquad.members) do
				if theMember.name == PlayerName then
					TriggerClientEvent('59e6ee1c-034d-4b40-9b73-699c88dda0ee', theMember.id, Squads[i].name)
					table.remove(Squads[i].members, theRow)
					Citizen.Trace("removed member from old squad\n")
					for ti,TM in ipairs(Squads[i].members) do
						TriggerClientEvent('1fd7aebd-d6a0-432f-a532-6609c6c2e427', TM.id, theMember.id, theMember.name)
						Citizen.Trace("telling members their member left\n")
					end
				end
			end
		end

		for i,theSquad in ipairs(Squads) do
			if #theSquad.members == 0 then
				table.remove(Squads, i)
				Citizen.Trace("removed dead squad")
			end
		end
	end)

	function PlayerJoinSquad(PlayerId,PlayerName,admin,SquadName)
		for i,theSquad in ipairs(Squads) do
			if theSquad.name == SquadName then
				table.insert(Squads[i].members, {id = PlayerId, name = PlayerName, admin = admin})
				TriggerClientEvent('4e1c2a99-e415-42d5-bdaa-7c846893bc5d', PlayerId, Squads[i].members, Squads[i].name)
			end
		end
	end

	AddEventHandler('playerDropped', function(reason)
		local PlayerName = GetPlayerName(source)
		for i,theSquad in ipairs(Squads) do
			for theRow,theMember in ipairs(theSquad.members) do
				if theMember.name == PlayerName then
					table.remove(Squads[i].members, theRow)
					for ti,TM in ipairs(Squads[i].members) do
						TriggerClientEvent('1fd7aebd-d6a0-432f-a532-6609c6c2e427', TM.id, theMember.id, theMember.name)
					end
				end
			end
		end
	end)
end)
