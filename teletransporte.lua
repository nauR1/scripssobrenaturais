-- Coordenadas do local secreto
local secretLocation = {x = -75.0, y = -819.0, z = 326.0}

RegisterCommand("portalsecreto", function(source)
    local playerPed = GetPlayerPed(source)
    SetEntityCoords(playerPed, secretLocation.x, secretLocation.y, secretLocation.z, false, false, false, true)
    
    TriggerClientEvent('chat:addMessage', source, {
        color = {0, 255, 127},
        args = {"[Poder]", "Você foi teletransportado para o local secreto!"}
    })
end)
