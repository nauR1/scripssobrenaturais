local nightvision_duration = 30 -- duração da visão noturna em segundos
local nightvision_active = {}

RegisterCommand("noturno", function(source)
    if not nightvision_active[source] then
        nightvision_active[source] = true
        TriggerClientEvent('chat:addMessage', source, {
            color = {0, 191, 255},
            args = {"[Sobrenatural]", "Visão noturna ativada! Dura " .. nightvision_duration .. " segundos."}
        })

        -- Ativar visão noturna
        TriggerClientEvent("activateNightVision", source, true)
        
        -- Desativar após o tempo
        Citizen.Wait(nightvision_duration * 1000)
        TriggerClientEvent("activateNightVision", source, false)
        TriggerClientEvent('chat:addMessage', source, {
            color = {0, 191, 255},
            args = {"[Sobrenatural]", "Visão noturna desativada."}
        })
        
        nightvision_active[source] = false
    else
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            args = {"[Erro]", "Visão noturna em recarga! Tente novamente em breve."}
        })
    end
end)

-- Evento do cliente para alternar a visão noturna
RegisterNetEvent("activateNightVision")
AddEventHandler("activateNightVision", function(toggle)
    SetNightvision(toggle)
end)
