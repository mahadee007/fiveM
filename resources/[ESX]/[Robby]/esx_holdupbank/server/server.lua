local rob = false
local robbers = {}
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function get3DDistance(x1, y1, z1, x2, y2, z2)
	return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2) + math.pow(z1 - z2, 2))
end

RegisterServerEvent('eac206a0-43fd-48bb-bdf3-a6105f64fa9e')
AddEventHandler('eac206a0-43fd-48bb-bdf3-a6105f64fa9e', function(robb)
	local source = source
	local xPlayers = ESX.GetPlayers()
	rob = false
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' or xPlayer.job.name == 'sealz' then
			TriggerClientEvent('8e8af900-8d56-4116-af4d-851ff5c3f798', xPlayers[i], _U('robbery_cancelled_at') .. Banks[robb].nameofbank)
			TriggerClientEvent('16e337c1-7437-4a2f-8261-00e28c3a3d38', xPlayers[i])
		end
	end
	if(robbers[source])then
		TriggerClientEvent('33d35aba-d32d-4d46-919f-a57c3f0f96f9', source)
		robbers[source] = nil
		TriggerClientEvent('8e8af900-8d56-4116-af4d-851ff5c3f798', source, _U('robbery_has_cancelled') .. Banks[robb].nameofbank)
	end
end)

RegisterServerEvent('5d750c07-bc18-4312-a3c1-68ccef13c9a2')
AddEventHandler('5d750c07-bc18-4312-a3c1-68ccef13c9a2', function(robb)

	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	
	if Banks[robb] then

		local bank = Banks[robb]

		if (os.time() - bank.lastrobbed) < 1500 and bank.lastrobbed ~= 0 then

			TriggerClientEvent('8e8af900-8d56-4116-af4d-851ff5c3f798', source, _U('already_robbed') .. (400 - (os.time() - bank.lastrobbed)) .. _U('seconds'))
			return
		end


		local cops = 0
		for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' or xPlayer.job.name == 'sealz' then
				cops = cops + 1
			end
		end


		if rob == false then

			if(cops >= Config.NumberOfCopsRequired)then

				rob = true
				for i=1, #xPlayers, 1 do
					local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
					if xPlayer.job.name == 'police' or xPlayer.job.name == 'sealz' then
							TriggerClientEvent('chatMessage', -1, 'ข่าวด่วน ', {255, 0, 0}, "มีเหตุการการโจรกรรมธนาคารเกิดขึ้นที่ ^2" .. bank.nameofbank)
							TriggerClientEvent('8e8af900-8d56-4116-af4d-851ff5c3f798', xPlayers[i], _U('rob_in_prog') .. bank.nameofbank)
							TriggerClientEvent('23f6e091-e336-486a-91ae-500f91c8fdd3', xPlayers[i], Banks[robb].position)
					end
				end

				TriggerClientEvent('8e8af900-8d56-4116-af4d-851ff5c3f798', source, _U('started_to_rob') .. bank.nameofbank .. _U('do_not_move'))
				TriggerClientEvent('8e8af900-8d56-4116-af4d-851ff5c3f798', source, _U('alarm_triggered'))
				TriggerClientEvent('8e8af900-8d56-4116-af4d-851ff5c3f798', source, _U('hold_pos'))
				TriggerClientEvent('7dade6a6-c4a1-4074-8dd7-fd81404ffaf5', source, robb)
				Banks[robb].lastrobbed = os.time()
				robbers[source] = robb
				local savedSource = source
				SetTimeout(300000, function()

					if(robbers[savedSource])then

						rob = false
						TriggerClientEvent('40617467-bc09-4c3a-9eb6-2857f801f457', savedSource, job)
						if(xPlayer)then

							xPlayer.addAccountMoney('black_money', bank.reward)
							local xPlayers = ESX.GetPlayers()
							for i=1, #xPlayers, 1 do
								local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
								if xPlayer.job.name == 'police' or xPlayer.job.name == 'sealz' then
										TriggerClientEvent('8e8af900-8d56-4116-af4d-851ff5c3f798', xPlayers[i], _U('robbery_complete_at') .. bank.nameofbank)
										TriggerClientEvent('16e337c1-7437-4a2f-8261-00e28c3a3d38', xPlayers[i])
								end
							end
						end
					end
				end)
			else
				TriggerClientEvent('8e8af900-8d56-4116-af4d-851ff5c3f798', source, _U('min_two_police') .. Config.NumberOfCopsRequired)
			end
		else
			TriggerClientEvent('8e8af900-8d56-4116-af4d-851ff5c3f798', source, _U('robbery_already'))
		end
	end
end)
