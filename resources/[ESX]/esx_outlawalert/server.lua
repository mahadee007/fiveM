ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterServerEvent('e948c5d1-d411-4f00-8463-a3cf196725e7')
AddEventHandler('e948c5d1-d411-4f00-8463-a3cf196725e7', function(street1, street2, veh, sex)
	if veh == "NULL" then
		TriggerClientEvent('2c5067c9-1421-48af-b027-5c8dd4ca4e5b', -1, "~r~Stealing Vehicle ~w~"..sex.." ~r~Between ~w~"..street1.."~r~ and ~w~"..street2)
	else
		TriggerClientEvent('2c5067c9-1421-48af-b027-5c8dd4ca4e5b', -1, "~r~Stealing Vehicle ~w~"..veh.." ~r~ by ~w~"..sex.." ~r~Between ~w~"..street1.."~r~ and ~w~"..street2)
	end
end)

RegisterServerEvent('22e853fe-33a0-43a6-96f7-d61c93e8eb10')
AddEventHandler('22e853fe-33a0-43a6-96f7-d61c93e8eb10', function(street1, veh, sex)
	if veh == "NULL" then
		TriggerClientEvent('2c5067c9-1421-48af-b027-5c8dd4ca4e5b', -1, "~r~Stealing Vehicle ~w~"..sex.." ~r~at ~w~"..street1)
	else
		TriggerClientEvent('2c5067c9-1421-48af-b027-5c8dd4ca4e5b', -1, "~r~Stealing Vehicle ~w~"..veh.." ~r~by ~w~"..sex.." ~r~at ~w~"..street1)
	end
end)

RegisterServerEvent('8f17ce0e-dd9e-4a01-82ab-52a5ef950b4b')
AddEventHandler('8f17ce0e-dd9e-4a01-82ab-52a5ef950b4b', function(street1, street2, veh, sex)
	if veh == "NULL" then
		TriggerClientEvent('2c5067c9-1421-48af-b027-5c8dd4ca4e5b', -1, "~r~Stealing Vehicle POLICE by ~w~"..sex.." ~r~Between ~w~"..street1.."~r~ and ~w~"..street2)
	else
		TriggerClientEvent('2c5067c9-1421-48af-b027-5c8dd4ca4e5b', -1, "~r~Stealing Vehicle POLICE ~w~"..veh.." ~r~ by ~w~"..sex.." ~r~Between ~w~"..street1.."~r~ and ~w~"..street2)

	end
end)

RegisterServerEvent('069b7c0a-3e33-44f2-b5c5-d4ad09758858')
AddEventHandler('069b7c0a-3e33-44f2-b5c5-d4ad09758858', function(street1, veh, sex)
	if veh == "NULL" then
		TriggerClientEvent('2c5067c9-1421-48af-b027-5c8dd4ca4e5b', -1, "~r~Volkswagen vehicles by POLICE by ~w~"..sex.." ~r~at ~w~"..street1)
	else
		TriggerClientEvent('2c5067c9-1421-48af-b027-5c8dd4ca4e5b', -1, "~r~POLICE vehicle theft ~w~"..veh.." ~r~by ~w~"..sex.." ~r~at ~w~"..street1)
	end
end)

-- RegisterServerEvent('56df97f0-1eb4-4be1-b1fb-c95d897f3239')
-- AddEventHandler('56df97f0-1eb4-4be1-b1fb-c95d897f3239', function(street1, street2, sex)
	-- TriggerClientEvent('2c5067c9-1421-48af-b027-5c8dd4ca4e5b', -1, "~r~Une bagarre a éclaté by ~w~"..sex.." ~r~between ~w~"..street1.."~r~ and ~w~"..street2)
-- end)

-- RegisterServerEvent('41fdc461-ca26-4c63-a105-222dfd75130c')
-- AddEventHandler('41fdc461-ca26-4c63-a105-222dfd75130c', function(street1, sex)
	-- TriggerClientEvent('2c5067c9-1421-48af-b027-5c8dd4ca4e5b', -1, "~r~Une bagarre a éclaté by ~w~"..sex.." ~r~à ~w~"..street1)
-- end)


RegisterServerEvent('d0b666c7-9e6c-4cac-bc60-b3ed34882cbe')
AddEventHandler('d0b666c7-9e6c-4cac-bc60-b3ed34882cbe', function(street1, street2, sex)
	TriggerClientEvent('2c5067c9-1421-48af-b027-5c8dd4ca4e5b', -1, "~r~Shooting by ~w~"..sex.." ~r~Betweed ~w~"..street1.."~r~ and ~w~"..street2)
end)

RegisterServerEvent('30502300-a00d-4e48-94a9-8e8358aeae8d')
AddEventHandler('30502300-a00d-4e48-94a9-8e8358aeae8d', function(street1, sex)
	TriggerClientEvent('2c5067c9-1421-48af-b027-5c8dd4ca4e5b', -1, "~r~Shooting ~w~"..sex.." ~r~at ~w~"..street1)
end)

RegisterServerEvent('9d69cd7e-a9b6-48d7-a36e-62ce890481ed')
AddEventHandler('9d69cd7e-a9b6-48d7-a36e-62ce890481ed', function(tx, ty, tz)
	TriggerClientEvent('6b8bbfee-61de-4d54-82bf-9195c29a371a', -1, tx, ty, tz)
end)

RegisterServerEvent('1931b20e-a4bb-4676-bd25-3e71fa42b497')
AddEventHandler('1931b20e-a4bb-4676-bd25-3e71fa42b497', function(gx, gy, gz)
	TriggerClientEvent('eddd8ae6-be00-4048-b8ad-7b8b402e5aff', -1, gx, gy, gz)
end)

-- RegisterServerEvent('0f3a721d-9e35-4303-a4ac-35d41372434c')
-- AddEventHandler('0f3a721d-9e35-4303-a4ac-35d41372434c', function(mx, my, mz)
	-- TriggerClientEvent('da521761-ce52-4301-be0d-045d9e14c070', -1, mx, my, mz)
-- end)

ESX.RegisterServerCallback('006e796e-a274-4116-a5d6-835f580e1922',function(source,cb, vehicleProps)
	local isFound = false
	local _source = source
	-- local xPlayer = ESX.getPlayerFromId(_source)
	-- local vehicules = getPlayerVehicles(xPlayer.getIdentifier())
	-- local plate = vehicleProps.plate
	
		-- for _,v in pairs(vehicules) do
			-- if(plate == v.plate)then
				-- isFound = true
				-- break
			-- end		
		-- end
		cb(isFound)
end)

-- function getPlayerVehicles(identifier)
	
	-- local vehicles = {}
	-- local data = MySQL.Sync.fetchAll("SELECT * FROM owned_vehicles WHERE owner=@identifier",{['@identifier'] = identifier})	
	-- for _,v in pairs(data) do
		-- local vehicle = json.decode(v.vehicle)
		-- table.insert(vehicles, {id = v.id, plate = vehicle.plate})
	-- end
	-- return vehicles
-- end