local forcefield_duration = 15 -- duração do campo de força em segundos
local cooldown_field = 60 -- cooldown do campo de força em segundos
local shield_active = {}

RegisterCommand("campodeforca", function(source)
    if not shield_active[source] then
        shield_active[source] = true
        local playerPed = GetPlayerPed(source)
        
        -- Ativar escudo (imunidade a danos)
        SetEntityInvincible(playerPed, true)
        TriggerClientEvent('chat:addMessage', source, {
            color = {0, 0, 255},
            args = {"[Poder]", "Campo de Força ativado! Você está protegido por " .. forcefield_duration .. " segundos."}
        })
        
        -- Desativar o escudo após o tempo
        Citizen.Wait(forcefield_duration * 1000)
        SetEntityInvincible(playerPed, false)
        TriggerClientEvent('chat:addMessage', source, {
            color = {0, 0, 255},
            args = {"[Poder]", "Campo de Força desativado!"}
        })
        
        -- Iniciar o cooldown
        Citizen.Wait(cooldown_field * 1000)
        shield_active[source] = false
    else
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            args = {"[Poder]", "Campo de Força em recarga! Tente novamente em breve."}
        })
    end
end)
