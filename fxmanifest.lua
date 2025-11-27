fx_version 'cerulean'
game 'gta5'

author 'DeinName'
description 'ESX Legacy – Professionelles Telefon-System mit Dispatch, WhatsApp, Twitter, Kamera & Anrufen'
version '2.0.0'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

shared_script 'config.lua'

client_scripts {
    '@es_extended/locale.lua',
    'client/client.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/server.lua'
}
