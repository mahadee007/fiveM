description 'ESX Blanchimment d\'argent'

client_scripts {
	'@es_extended/locale.lua',
	'locales/th.lua',
	'config.lua',
	'client/main.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'locales/th.lua',
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server/main.lua'
}