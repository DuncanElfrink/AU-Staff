local showStaffTag = false

RegisterNetEvent('staff:toggleStaffTag')
AddEventHandler('staff:toggleStaffTag', function()
    showStaffTag = not showStaffTag

    if showStaffTag then
        TriggerEvent('chat:addSuggestion', '/staff', 'Toggle Staff Tag')
    else
        TriggerEvent('chat:removeSuggestion', '/staff')
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if showStaffTag then
            DrawText3D(GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z + 1.0, "[AU] Staff")
        end
    end
end)

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)

    AddTextComponentString(text)
    DrawText(_x, _y)

    local factor = (string.len(text)) / 350
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 75)
end
