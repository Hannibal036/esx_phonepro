ESX = exports['es_extended']:getSharedObject()
local isPhoneOpen = false
local activeCall = nil

-- Keybind für Telefon
RegisterCommand('phone', function()
    togglePhone()
end)

RegisterKeyMapping('phone', 'Open Phone', 'keyboard', Config.PhoneKey)

function togglePhone()
    isPhoneOpen = not isPhoneOpen
    SetNuiFocus(isPhoneOpen, isPhoneOpen)
    SendNUIMessage({ action = 'togglePhone', state = isPhoneOpen })
end

-- NUI Callbacks
RegisterNUICallback('startCall', function(data, cb)
    TriggerServerEvent('phone:startCall', data.targetPlayerId, data.phoneNumber)
    cb('ok')
end)

RegisterNUICallback('acceptCall', function(data, cb)
    TriggerServerEvent('phone:acceptCall', data.callId)
    cb('ok')
end)

RegisterNUICallback('endCall', function(data, cb)
    TriggerServerEvent('phone:endCall', data.callId)
    cb('ok')
end)

-- Dispatch-Callbacks
RegisterNUICallback('acceptDispatch', function(data, cb)
    TriggerServerEvent('phone:acceptDispatch', data.type, data.id)
    cb('ok')
end)

RegisterNUICallback('completeDispatch', function(data, cb)
    TriggerServerEvent('phone:completeDispatch', data.type, data.id)
    cb('ok')
end)

-- Nummern teilen
RegisterNUICallback('shareNumber', function(data, cb)
    TriggerServerEvent('phone:shareNumber', data.targetPlayerId, data.number)
    cb('ok')
end)

-- Kamera Bilder hochladen
RegisterNUICallback('savePhoto', function(data, cb)
    TriggerServerEvent('phone:savePhoto', data.image)
    cb('ok')
end)

-- Events vom Server
RegisterNetEvent('phone:incomingCall')
AddEventHandler('phone:incomingCall', function(callId, senderId, phoneNumber)
    SendNUIMessage({ action = 'incomingCall', callId = callId, senderId = senderId, phoneNumber = phoneNumber })
end)

RegisterNetEvent('phone:callStarted')
AddEventHandler('phone:callStarted', function(callId, targetPlayerId, phoneNumber)
    activeCall = callId
    SendNUIMessage({ action = 'callActive', callId = callId })
end)

RegisterNetEvent('phone:callEnded')
AddEventHandler('phone:callEnded', function(callId)
    if activeCall == callId then activeCall = nil end
    SendNUIMessage({ action = 'callEnded', callId = callId })
end)

RegisterNetEvent('phone:voiceStart')
AddEventHandler('phone:voiceStart', function(player1, player2)
    exports['pma-voice']:SetCallChannel(player1, player2)
end)

-- Utility: Debug
function debugPrint(msg)
    if Config.Debug then print('[PhonePro] '..msg) end
end
