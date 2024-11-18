local aura_duration = 10 -- duração da aura em segundos
local heal_amount = 10 -- quantidade de vida recuperada por segundo

RegisterCommand("cura", function(source)
    local playerPed = GetPlayerPed(source)
    local coords = GetEntityCoords(playerPed)

    TriggerClientEvent('chat:addMessage', source, {
        color = {0, 255, 0},
        args = {"[Sobrenatural]", "Aura de Cura ativada! Você e seus aliados serão curados."}
    })

    for i = 1, aura_duration do
        Citizen.Wait(1000)
        local players = GetActivePlayers()
        for _, player in ipairs(players) do
            local ped = GetPlayerPed(player)
            local playerCoords = GetEntityCoords(ped)
            
            -- Verifica se o jogador está na área de cura (5 metros)
            if #(playerCoords - coords) <= 5.0 then
                local newHealth = GetEntityHealth(ped) + heal_amount
                SetEntityHealth(ped, newHealth)
            end
        end
    end
end)
