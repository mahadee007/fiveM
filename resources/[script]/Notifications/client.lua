RegisterNetEvent("Trigger_Success_Notification:Client")
AddEventHandler("Trigger_Success_Notification:Client", function(message)
    SendNUIMessage({
        showing = true,
        newText = message,
    })
end)

RegisterNetEvent("Trigger_Error_Notification:Client")
AddEventHandler("Trigger_Error_Notification:Client", function(message)
    SendNUIMessage({
        showing = false,
        newText = message,
    })
end)