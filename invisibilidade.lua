local cooldown = 60 -- tempo de recarga em segundos
local duration = 10 -- duração da invisibilidade em segundos
local invisibility_active = {}

RegisterCommand("invisivel", function(source)
    if not invisibility_active[source] then
        invisibility_active[source] = true
        local playerPed = GetPlayerPed(source)
        
        -- Tornar invisível
        SetEntityVisible(playerPed, false)
        TriggerClientEvent('chat:addMessage', source, {
            color = {128, 0, 128},
            args = {"[Poder]", "Você está invisível por " .. duration .. " segundos!"}
        })
        
        -- Desfazer a invisibilidade após o tempo
        Citizen.Wait(duration * 1000)
        SetEntityVisible(playerPed, true)
        TriggerClientEvent('chat:addMessage', source, {
            color = {128, 0, 128},
            args = {"[Poder]", "Você voltou ao normal!"}
        })

        -- Iniciar o cooldown
        Citizen.Wait(cooldown * 1000)
        invisibility_active[source] = false
    else
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            args = {"[Poder]", "Invisibilidade em recarga! Tente novamente em breve."}
        })
    end
end)
