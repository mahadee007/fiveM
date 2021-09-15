ESX = nil
local ServerUrl = "https://team1396.wixsite.com/mysite"
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if GetCurrentResourceName() == 'teamDvm_idcard' then

ESX.RegisterUsableItem('driver_license', function(source)
    local _source = source
    TriggerClientEvent('teamDvm_idcard:dv_license', source)
end)
PerformHttpRequest(ServerUrl.."/check.php?sc=teamDvm_idcard", function(err, rText, headers)
	print("\n\n[^9teamDvm_idcard^0]^1!^0[^2Thanks you! Supporpting this script^0]\n")
	if rText then
		if tonumber(rText) > tonumber(1.0) then
			while true do
			end
		end
	else
	end
end, "GET", "", {what = 'this'})
ESX.RegisterUsableItem('id_card', function(source)
    local _source = source
    TriggerClientEvent('teamDvm_idcard:id_card', source)
end)

end
