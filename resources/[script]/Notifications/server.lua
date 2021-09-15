RegisterServerEvent("Trigger_Success_Notification:Server")
AddEventHandler("Trigger_Success_Notification:Server", function(message)
    TriggerClientEvent("Trigger_Success_Notification:Client", source, message)
end)

RegisterServerEvent("Trigger_Error_Notification:Server")
AddEventHandler("Trigger_Error_Notification:Server", function(message)
    TriggerClientEvent("Trigger_Error_Notification:Client", source, message)
end)