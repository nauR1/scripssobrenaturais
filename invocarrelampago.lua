RegisterCommand("relampago", function(source, args)
    local targetId = tonumber(args[1])
    
    if targetId and GetPlayerPing(targetId) > 0 then
        local targetPed = GetPlayerPed(targetId)
        local coords = GetEntityCoords(targetPed)

        -- Invoca o raio na posição do alvo
        AddExplosion(coords.x, coords.y, coords.z, 29, 1.0, true, false, 1.0)
        
        TriggerClientEvent('chat:addMessage', -1, {
            color = {255, 255, 0},
            args = {"[Sobrenatural]", GetPlayerName(source) .. " invocou um relâmpago!"}
        })
    else
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            args = {"[Erro]", "ID do jogador inválido."}
        })
    end
end)
