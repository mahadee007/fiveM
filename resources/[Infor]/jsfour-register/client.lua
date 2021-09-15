local ESX	 = nil
local open = false
local cam  = nil

-- ESX
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

-- Open the register form, (call from server)
RegisterNetEvent('jsfour-register:open')
AddEventHandler('jsfour-register:open', function()
	if not DoesCamExist(cam) then
		cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
	end
	SetCamActive(cam,  true)
	RenderScriptCams(true,  false,  0,  true,  true)
	SetCamCoord(cam, -288.92544555664, -2443.6701660156, 591.98687744141)
	PointCamAtCoord(cam, -169.18321228027, -1056.4204101563, 129.99223327637)

	SetEntityCollision(GetPlayerPed(-1),  false,  false)
	SetEntityVisible(GetPlayerPed(-1),  false)
	FreezeEntityPosition(GetPlayerPed(-1), true);

	SetNuiFocus(true, true)
	open = true
	SendNUIMessage({
		action = "open"
	})
end)

-- Register the player (call from javascript > send to server < callback from server)
RegisterNUICallback('register', function(data, cb)
	cb('ok')
	ESX.TriggerServerCallback('jsfour-register:register', function( success )
		if success then
			SetNuiFocus(false, false)
			open = false

			SendNUIMessage({
				action = "close"
			})

			DoScreenFadeOut(1000)
			Wait(1000)
			SetCamActive(cam,  false)
			RenderScriptCams(false,  false,  0,  true,  true)
			SetEntityCollision(GetPlayerPed(-1),  true,  true)
			SetEntityVisible(GetPlayerPed(-1),  true)
			FreezeEntityPosition(GetPlayerPed(-1), false)
			--SetEntityCoords(GetPlayerPed(-1), -235.42385864258, -2002.8851318359, 23.685377120972)
			TriggerEvent('esx_skin:openSaveableMenu')
			DoScreenFadeIn(1000)
			Wait(1000)

		end
	end, data)
end)

-- Freeze player movements
Citizen.CreateThread(function()
    while true do
			Citizen.Wait(0)
      if open then
	      DisableControlAction(0, 1, true) -- LookLeftRight
	      DisableControlAction(0, 2, true) -- LookUpDown
	      DisableControlAction(0, 24, true) -- Attack
	      DisablePlayerFiring(GetPlayerPed(-1), true) -- Disable weapon firing
	      DisableControlAction(0, 142, true) -- MeleeAttackAlternate
	      DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
		  DisableControlAction(0, 32, true) -- W
		  DisableControlAction(0, 34, true) -- A
		  DisableControlAction(0, 9, true) -- D
		  DisableControlAction(0, 8, true) -- S
		  DisableControlAction(0, 22, true) -- Spacbar
		  DisableControlAction(0, 322, true) -- ESX
		  DisableControlAction(0, 288, true) -- F1
		  DisableControlAction(0, 289, true) -- F2
		  DisableControlAction(0, 170, true) -- F3
		  DisableControlAction(0, 166, true) -- F5
		  DisableControlAction(0, 168, true) -- F7
		  DisableControlAction(0, 169, true) -- F8
		  DisableControlAction(0, 56, true) -- F9
		  DisableControlAction(0, 57, true) -- F10
		  DisableControlAction(0, 213, true) -- HOME
		  DisableControlAction(0, 178, true) -- DELETE
		  
      end
    end
end)
