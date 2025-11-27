fx_version 'cerulean'
game 'gta5'

author 'DeinName'
description 'ESX Legacy – Professionelles Telefon-System mit Dispatch, WhatsApp, Twitter, Kamera & Anrufen'
version '2.0.0'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/assets/icons/police.png',
    'html/assets/icons/ambulance.png',
    'html/assets/icons/mechanic.png',
    'html/assets/icons/fire.png',
    'html/assets/icons/whatsapp.png',
    'html/assets/icons/twitter.png',
    'html/assets/icons/camera.png',
    'html/assets/backgrounds/default.jpg',
    'html/assets/ringtones/ringtone1.mp3',
    'html/assets/ringtones/ringtone2.mp3'
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
