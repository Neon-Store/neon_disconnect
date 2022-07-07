AddEventHandler('playerDropped', function (reason)
    local src = source
    local playerCoords = GetEntityCoords(GetPlayerPed(src))
    TriggerClientEvent('neon_disconnected:disconnect', -1, src, playerCoords, reason)
end)