function displayPermissionIssue ()
  TriggerClientEvent('chatMessage', source, 'SYSTEM', { 255, 0, 0 }, 'Insufficienct permissions!')
end

TriggerEvent('53442436-c58b-4794-b4d2-5686cc8d2566', 'whitelist:load', 'admin', function (source, args, user)
  loadWhiteList()
end, function (source, args, user)
  displayPermissionIssue(source)
end, { help = _U('help_whitelist_load') })

TriggerEvent('53442436-c58b-4794-b4d2-5686cc8d2566', 'whitelist:add', 'admin', function (source, args, user)
  local steamID = 'steam:' .. args[1]

  MySQL.Async.execute(
    'INSERT INTO whitelist (identifier) VALUES (@identifier)',
    { ['@identifier'] = tostring(steamID) },
    function ()
      loadWhiteList()
    end
  )
end, function (source, args, user)
  displayPermissionIssue(source)
end, { help = _U('help_whitelist_add'), params = { steam = 'SteamID', help = 'SteamID formated to hex' }})
