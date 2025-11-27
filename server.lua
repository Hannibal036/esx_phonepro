ESX = exports['es_extended']:getSharedObject()
local activeCalls = {} -- [callId] = {sender, receiver, phoneNumber, state}

-- Telefon Anrufe
RegisterServerEvent('phone:startCall')
AddEventHandler('phone:startCall', function(targetPlayerId, phoneNumber)
    local src = source
    local targetPlayer = ESX.GetPlayerFromId(targetPlayerId)
    if not targetPlayer then
        TriggerClientEvent('phone:callFailed', src, 'Spieler nicht verfügbar')
        return
    end

    local callId = math.random(1000,9999)
    activeCalls[callId] = { sender = src, receiver = targetPlayerId, phoneNumber = phoneNumber, state = 'ringing' }

    TriggerClientEvent('phone:incomingCall', targetPlayerId, callId, src, phoneNumber)
    TriggerClientEvent('phone:callStarted', src, callId, targetPlayerId, phoneNumber)
end)

RegisterServerEvent('phone:acceptCall')
AddEventHandler('phone:acceptCall', function(callId)
    local call = activeCalls[callId]
    if not call then return end

    call.state = 'active'
    TriggerClientEvent('phone:callActive', call.sender, callId)
    TriggerClientEvent('phone:callActive', call.receiver, callId)
    TriggerClientEvent('phone:voiceStart', call.sender, call.receiver)
end)

RegisterServerEvent('phone:endCall')
AddEventHandler('phone:endCall', function(callId)
    local call = activeCalls[callId]
    if not call then return end

    TriggerClientEvent('phone:callEnded', call.sender, callId)
    TriggerClientEvent('phone:callEnded', call.receiver, callId)
    activeCalls[callId] = nil
end)

-- Dispatch-System
local dispatchTypes = {'police', 'ambulance', 'fire', 'mechanic'}

RegisterServerEvent('phone:acceptDispatch')
AddEventHandler('phone:acceptDispatch', function(type, id)
    TriggerClientEvent('phone:dispatchAccepted', -1, type, id, source)
end)

RegisterServerEvent('phone:completeDispatch')
AddEventHandler('phone:completeDispatch', function(type, id)
    TriggerClientEvent('phone:dispatchCompleted', -1, type, id)
end)

-- Nummern-Sharing
RegisterServerEvent('phone:shareNumber')
AddEventHandler('phone:shareNumber', function(targetPlayerId, number)
    local src = source
    TriggerClientEvent('phone:receiveSharedNumber', targetPlayerId, src, number)
end)

-- Kamera Bilder speichern
RegisterServerEvent('phone:savePhoto')
AddEventHandler('phone:savePhoto', function(imageData)
    local src = source
    MySQL.Async.execute('INSERT INTO phone_gallery (identifier, image, date) VALUES (@identifier, @image, NOW())', {
        ['@identifier'] = ESX.GetPlayerFromId(src).identifier,
        ['@image'] = imageData
    })
end)

-- Utility: Debug
function debugPrint(msg)
    if Config.Debug then print('[PhonePro] '..msg) end
end
