

resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

description 'Scotty: Police Alert'

files {
	'html/main.html',
	'html/main.mp3',
}

ui_page {
	'html/main.html',
}

client_scripts {
	'config.lua',
	'client.lua',
}

server_scripts {
	'config.lua',
	'server.lua'
}