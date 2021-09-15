ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local onlinePlayers = GetNumPlayerIndices()

ESX.RegisterServerCallback('w1ms_scoreboard:data', function(source, cb)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		local data = {}

		for i=1, #result, 1 do
			table.insert(data, {
				phone   = result[i].phone_number,
				name   = result[i].name,
				job   = get_jobname(result[i].job),
				ping = GetPlayerPing(source)
			})
		end

		cb(data)
	end)
end)


function get_jobname(job)
	MySQL.Async.fetchAll('SELECT * FROM jobs WHERE name = @job', {
		['@job'] = job
	}, function(result)
		return result[1].label
	end)
end

function get_jobname(job)
	local result = MySQL.Sync.fetchAll("SELECT * FROM jobs WHERE name = @job", {['@job'] = job})
	if result[1] ~= nil then
		local identity = result[1]
		return identity['label']
	else
		return nil
	end
end


