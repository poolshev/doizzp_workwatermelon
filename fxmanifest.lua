fx_version 'cerulean'
game 'gta5'

author 'Poolshev'
description 'Emprego de Plantação de Melancia integrado no sistema de colheita'
version '1.0.0'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    '@vrp/lib/utils.lua', -- Remove se não usar vRP
    'server.lua'
}
