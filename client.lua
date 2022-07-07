function DrawTextInPos(coords, text, p3)
    local x, y, z = table.unpack(coords)
    z = z + 1
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    if onScreen then
        local px,py,pz=table.unpack(GetGameplayCamCoords())
        local dist = #(vector3(px,py,pz) - vector3(x,y,z))

        local scale = (1/dist)*4
        local fov = (1/GetGameplayCamFov())*100
        local scale = scale*fov
        SetTextScale(0.0*scale, 0.30*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(5)
        AddTextComponentString(text)
        DrawText(_x,_y)
        return
    else
        return
    end
end

RegisterNetEvent('neon_disconnected:disconnect', function(src, coords, reason)
    local dist = GetDistanceBetweenCoords(coords, GetEntityCoords(PlayerPedId()))
    if dist < 50 then
        local x = 2000
        while x > 0 do
            DrawMarker(32, coords.x, coords.y, coords.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 255, false, true, 2, nil, nil, false)
            DrawTextInPos(coords, string.format("[%s] - Reason: \"%s\"",  src, reason))
            x = x - 1
            Citizen.Wait(0)
        end
    end
end)