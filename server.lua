ESX = exports["es_extended"]:getSharedObject()

RegisterCommand('staff', function(source, args, rawCommand)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getGroup() == 'admin' then
        TriggerClientEvent('staff:toggleStaffTag', _source)
    else
        TriggerClientEvent('chat:addMessage', _source, { args = { '^1ERROR', 'You do not have access to this command!' } })
    end
end, true)
