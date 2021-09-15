local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX             				 = nil

local cardOpen 					= false
local playerData 				= {}
local windowavg					= false
local windowavd					= false
local windowarg					= false
local windoward					= false
local window 					= false
local engineOn 					= true
local speedkm 					= 0


Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('smerfikubrania:koszulka')
AddEventHandler('smerfikubrania:koszulka', function()
	TriggerEvent('skinchanger:getSkin', function(skin)
	

		local clothesSkin = {
		['tshirt_1'] = 15, ['tshirt_2'] = 0,
		['torso_1'] = 15, ['torso_2'] = 0,
		['arms'] = 15, ['arms_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	end)
end)
RegisterNetEvent('smerfikubrania:spodnie')
AddEventHandler('smerfikubrania:spodnie', function()
	TriggerEvent('skinchanger:getSkin', function(skin)
	

		local clothesSkin = {
		['pants_1'] = 21, ['pants_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	end)
end)

RegisterNetEvent('smerfikubrania:buty')
AddEventHandler('smerfikubrania:buty', function()
	TriggerEvent('skinchanger:getSkin', function(skin)
	

		local clothesSkin = {
		['shoes_1'] = 34, ['shoes_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	end)
end)


-- Servern callback
RegisterNetEvent('jsfour-legitimation:open')
AddEventHandler('jsfour-legitimation:open', function(playerData)
	cardOpen = true
	SendNUIMessage({
		action = "open",
		array = playerData
	})
end)

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

-- Giving ID Animation
function OpenGivingID()
  local pP = GetPlayerPed(-1)

  Citizen.CreateThread(function()

    local pP = GetPlayerPed(-1)
    TaskPlayAnim(pP, "mp_common", "givetake1_a", 3.5, -8, -1, 2, 0, 0, 0, 0, 0)
    Citizen.CreateThread(function()
      Citizen.Wait(10000)
      TriggerServerEvent('esx_personmeny:give_id')
      ClearPedTasksImmediately(pP)
      end)
    end)
end

-- No one Near Animation
function OpenNoOneNear()
  local pP = GetPlayerPed(-1)

  Citizen.CreateThread(function()

    local pP = GetPlayerPed(-1)
    TaskPlayAnim(pP, "anim@mp_player_intcelebrationmale@face_palm", "face_palm", 3.5, -8, -1, 2, 0, 0, 0, 0, 0)
    Citizen.CreateThread(function()
      Citizen.Wait(10000)
      TriggerServerEvent('esx_personmeny:idnoonenear')
      ClearPedTasksImmediately(pP)
      end)
    end)
end

function OpenTrashCan()
  local pP = GetPlayerPed(-1)

  Citizen.CreateThread(function()

    local pP = GetPlayerPed(-1)
    TaskPlayAnim(pP, "mp_common", "givetake2_a", 3.5, -8, -1, 2, 0, 0, 0, 0, 0)
    TaskStartScenarioInPlace(pP, "mp_common", 0, true)
    Citizen.CreateThread(function()
      Citizen.Wait(2000)
      ClearPedTasksImmediately(pP)
      end)
    end)
end

function OpenAttansCan()
  local pP = GetPlayerPed(-1)

  Citizen.CreateThread(function()

    local pP = GetPlayerPed(-1)
    TaskPlayAnim(pP, "gestures@m@standing@casual", "gesture_damn", 3.5, -8, -1, 2, 0, 0, 0, 0, 0)
    TaskStartScenarioInPlace(pP, "gestures@m@standing@casual", 0, true)
    FreezeEntityPosition(playerPed, true)
    Citizen.CreateThread(function()
      Citizen.Wait(2000)
      FreezeEntityPosition(playerPed, false)
      ClearPedTasksImmediately(pP)
      end)
    end)
end

function FastTravel(coords, heading)
	local playerPed = PlayerPedId()

	DoScreenFadeOut(800)

	while not IsScreenFadedOut() do
		Citizen.Wait(500)
	end

	ESX.Game.Teleport(playerPed, coords, function()
		DoScreenFadeIn(800)

		if heading then
			SetEntityHeading(playerPed, heading)
		end
	end)
end
--[[
function OpenShowGiveID()

ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'id_card_menu',
	{
		title    = _U('id_menu'),
		elements = {
			{label = _U('check_id'), value = 'check'},
			{label = _U('show_id'), value = 'show'}
		}
	},
	function(data2, menu2)
		if data2.current.value == 'check' then
			TriggerServerEvent('jsfour-legitimation:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
		elseif data2.current.value == 'show' then
			local player, distance = ESX.Game.GetClosestPlayer()

			if distance ~= -1 and distance <= 3.0 then
				TriggerServerEvent('jsfour-legitimation:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))
				OpenTrashCan()
			else
				OpenAttansCan()
				TriggerEvent("pNotify:SendNotification",{
					text = _U('nobody_near'),
					type = "error",
					timeout = (3000),
					layout = "bottomcenter",
					queue = "global"
				});
			end
		end
	end,
	function(data2, menu2)
		menu2.close()
		OpenCivilianActionsMenu()
	end
)

end
]]

function OpenCivilianActionsMenu()

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
  'default', GetCurrentResourceName(), 'civilian_actions',
  {
    title    = _U('citizen_interactions'),
    align    = 'right',
    elements = {
      --{label = 'เมนูช่วยเหลือฉุกเฉิน', value = 'revivemenu'},
      {label = _U('vehicle_menu'), value = 'vehiclemenu'},
     -- {label = _U('id_card'), value = 'id_kort'},
	  {label = 'เอกสารราชการ', value = 'โชว์ใบอณุญาติ'},
     {label = 'เสื้อผ้า', value = 'เสื้อผ้า'},
      {label = 'หมวกและอื่นๆ', value = 'อุปกรณ์ปิดบังใบหน้า'},
      {label = _U('blindfold'), value = 'blindfold'},
    }
  },
    
    function(data, menu)

      if data.current.value == 'id_kort' then
      	OpenShowGiveID()
      end

      if data.current.value == 'blindfold' then
        local player, distance = ESX.Game.GetClosestPlayer()

      if distance ~= -1 and distance <= 3.0 then
           ESX.TriggerServerCallback('jsfour-blindfold:itemCheck', function( hasItem )
              TriggerServerEvent('jsfour-blindfold', GetPlayerServerId(player), hasItem)
           end)
      else
           TriggerEvent("pNotify:SendNotification",{
					text = _U('nobody_near'),
					type = "error",
					timeout = (3000),
					layout = "bottomcenter",
					queue = "global"
				});
          end
      end

      if data.current.value == 'vehiclemenu' then
        local playerPed = GetPlayerPed(-1)
        if IsPedSittingInAnyVehicle(playerPed) then
            local playerVeh = GetVehiclePedIsIn(playerPed, false)
            local drivingPed = GetPedInVehicleSeat(playerVeh, -1)
            if drivingPed == playerPed then
                OpenVehicleMenu()
            end
        end
      end

      if data.current.value == 'เสื้อผ้า' then
			OpenActionMenuInteraction()
      elseif data.current.value == 'อุปกรณ์ปิดบังใบหน้า' then
          OpenAccessoryMenu()
	    elseif data.current.value == 'โชว์ใบอณุญาติ' then
          openMenuDrive()
      elseif data.current.value == 'revivemenu' then
          OpenReviveMenuCiv()
       end

      if data.current.value == 'check' then
            TriggerServerEvent('jsfour-legitimation:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
      elseif data.current.value == 'show' then
           local player, distance = ESX.Game.GetClosestPlayer()

      if distance ~= -1 and distance <= 3.0 then
        TriggerServerEvent('jsfour-legitimation:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))
      else
        TriggerEvent("pNotify:SendNotification",{
					text = _U('nobody_near'),
					type = "error",
					timeout = (3000),
					layout = "bottomcenter",
					queue = "global"
				});
      end
    end
    end,
    function(data, menu)
      menu.close()
    end
  )
end
-----------------------------------------------
function OpenReviveMenuCiv()

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mobile_ambulance_actions', {
		title    =  'Emmergency Menu For Citizen',
		align    = 'right',
		elements = {
			{label = 'Revive', value = 'citizen_emsforciv'}
		}
	}, function(data, menu)
		if data.current.value == 'citizen_emsforciv' then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_emsforciv', {
				title    = 'Revive Menu',
				align    = 'right',
				elements = {
					{label = 'AED Revive', value = 'revive'}
				}
			}, function(data, menu)
				if IsBusy then return end

				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				if closestPlayer == -1 or closestDistance > 1.0 then
					ESX.ShowNotification('No players nearby')
				else

					if data.current.value == 'revive' then

						IsBusy = true

						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity > 0 then
								local closestPlayerPed = GetPlayerPed(closestPlayer)

								if IsPedDeadOrDying(closestPlayerPed, 1) then
									local playerPed = PlayerPedId()

									ESX.ShowNotification('A revive is in progress!')

									local lib, anim = 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest'

									for i=1, 15, 1 do
										Citizen.Wait(900)
								
										ESX.Streaming.RequestAnimDict(lib, function()
                      TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
										end)
									end

									TriggerServerEvent('esx_ambulancejob:removeItem', 'AED')
									TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(closestPlayer))

									-- Show revive award?
									if Config.ReviveReward > 0 then
										ESX.ShowNotification('you have revived ~y~%s~s~ and earned ~g~$%s~s~!', GetPlayerName(closestPlayer), Config.ReviveReward)
									else
										ESX.ShowNotification('you have revived ~y~%s~s~', GetPlayerName(closestPlayer))
									end
								else
									ESX.ShowNotification('that player is not unconscious!')
								end
							else
								ESX.ShowNotification('You do not have ~R~Defibrillator~s~.')
							end

							IsBusy = false

						end, 'AED')
					end
				end
			end, function(data, menu)
				menu.close()
			end)
		end

	end, function(data, menu)
		menu.close()
	end)
end

-----------------------------------------------
function openMenuDrive()
  ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'id_card_menu',
	{
		title    = 'ID menu',
		align 	 = 'right',
		elements = {
			{label = 'เช็คบัตรประชาชน', value = 'checkID'},
			{label = 'แสดงบัตรประชาชน', value = 'showID'},
			{label = 'เช็คใบอณุญาติใบขับขี่', value = 'checkDriver'},
			{label = 'แสดงใบอณุญาติใบขับขี่', value = 'showDriver'},
			{label = 'เช็คใบอณุญาติพกอาวุธปืน', value = 'checkFirearms'},
			{label = 'แสดงใบอณุญาติพกอาวุธปืน', value = 'showFirearms'},
		}
	},
	function(data, menu)
		local val = data.current.value
		
		if val == 'checkID' then
			TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
		elseif val == 'checkDriver' then
			TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
		elseif val == 'checkFirearms' then
			TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
		else
			local player, distance = ESX.Game.GetClosestPlayer()
			
			if distance ~= -1 and distance <= 3.0 then
				if val == 'showID' then
				TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))
				elseif val == 'showDriver' then
			TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')
				elseif val == 'showFirearms' then
			TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'weapon')
				end
			else
			  ESX.ShowNotification('No players nearby')
			end
		end
	end,
	function(data, menu)
		menu.close()
	end
)
end


---------------------------------------------

function OpenAccessoryMenu()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'action_menu',
	{
		title = _U('set_unset'),
		align = 'right',
		elements = {
			{label = _U('helmet'), value = 'Helmet'},
			{label = _U('ears'), value = 'Ears'},
			{label = _U('mask'), value = 'Mask'},
			{label = _U('glasses'), value = 'Glasses'}
		}
	}, function(data, menu)
		menu.close()
		SetUnsetAccessory(data.current.value)

	end, function(data, menu)
		menu.close()
	end)
end


function SetUnsetAccessory(accessory)
	ESX.TriggerServerCallback('esx_accessories:get', function(hasAccessory, accessorySkin)
		local _accessory = string.lower(accessory)

		if hasAccessory then
			TriggerEvent('skinchanger:getSkin', function(skin)
				local mAccessory = -1
				local mColor = 0

				if _accessory == "mask" then
					mAccessory = 0
				end

				if skin[_accessory .. '_1'] == mAccessory then
					mAccessory = accessorySkin[_accessory .. '_1']
					mColor = accessorySkin[_accessory .. '_2']
				end

				local accessorySkin = {}
				accessorySkin[_accessory .. '_1'] = mAccessory
				accessorySkin[_accessory .. '_2'] = mColor
				TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
			end)
		else
			ESX.ShowNotification(_U('no_' .. _accessory))
		end

	end, accessory)
end
---------------------------------------------

function OpenActionMenuInteraction()

	local elements = {}

	table.insert(elements, {label = ('ใส่เสื้อผ้า'), value = 'ubie'})
	table.insert(elements, {label = ('ถอดเสื้อ'), value = 'tul'})
	table.insert(elements, {label = ('ถอดกางเกง'), value = 'spo'})
	table.insert(elements, {label = ('ถอดรองเท้า'), value = 'but'})
  		ESX.UI.Menu.CloseAll()	


	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'action_menu',
		{
			title    = ('Clothes'),
			align    = 'right',
			elements = elements
		},
    function(data, menu)



		
		if data.current.value == 'ubie' then			
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
		end)
		OpenActionMenuInteraction()	
		elseif data.current.value == 'tul' then
		TriggerEvent('smerfikubrania:koszulka')
		OpenActionMenuInteraction()	
		elseif data.current.value == 'spo' then
		TriggerEvent('smerfikubrania:spodnie')
		OpenActionMenuInteraction()	
		elseif data.current.value == 'but' then
		TriggerEvent('smerfikubrania:buty')
		OpenActionMenuInteraction()	
	  end
	end,
	function(data, menu)
    menu.close()
    OpenCivilianActionsMenu()
  end
	)
end

function OpenVehicleMenu()

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'vehicle_actions',
    {
      title    = _U('vehicle_menu'),
      align    = 'right',
      elements = {
       -- {label = _U('engine'),           value = 'engine'},
        {label = _U('doors'),        value = 'door'},
        {label = _U('window'),         value = 'window'},
       -- {label = _U('cruise_control'),   value = 'cruise_control'},
        --{label = _U('shuff'),      value = 'changeseat'},
      }
    },
    function(data, menu)
      if data.current.value == 'engine' then
        local playerPed = GetPlayerPed(-1)
          local playerVeh = GetVehiclePedIsIn(playerPed, false)
        if engineOn == true then
                SetVehicleUndriveable(playerVeh, true)
            SetVehicleEngineOn(playerVeh, false, false, false)
            engineOn = false
            TriggerEvent("pNotify:SendNotification", {text = _U('turned_off_engine'), type = "error", queue = "vehiclemenu", timeout = 3000, layout = "bottomcenter"})

        else
          SetVehicleUndriveable(playerVeh, false)
            SetVehicleEngineOn(playerVeh, true, false, false)       
                engineOn = true
            TriggerEvent("pNotify:SendNotification", {text = _U('turned_on_engine'), type = "success", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})
        end
      end

      if data.current.value == 'changeseat' then
        TriggerEvent("SeatShuffle")
      end

      if data.current.value == 'door' then
        ESX.UI.Menu.CloseAll()

        ESX.UI.Menu.Open(
          'default', GetCurrentResourceName(), 'door_actions',
          {
            title    = _U('doors'),
            align    = 'right',
            elements = {
              {label = _U('hood'),        value = 'hood'},
              {label = _U('trunk'),           value = 'trunk'},
              {label = _U('front_left_door'),   value = 'dooravg'},
              {label = _U('front_right_door'),     value = 'dooravd'},
              {label = _U('back_left_door'),      value = 'doorarg'},
              {label = _U('back_right_door'),      value = 'doorard'}
            }
          },
          function(data, menu)
            if data.current.value == 'hood' then
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if (IsPedSittingInAnyVehicle(playerPed)) then
                  if GetVehicleDoorAngleRatio(playerVeh, 4) > 0.0 then 
                      SetVehicleDoorShut(playerVeh, 4, false)
                      TriggerEvent("pNotify:SendNotification", {text = "ปิดฝากระโปรงหน้า!", type = "error", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})
                   else
                      SetVehicleDoorOpen(playerVeh, 4, false)
                      frontleft = true
                      TriggerEvent("pNotify:SendNotification", {text = "เปิดฝากระโปรงหน้า!", type = "success", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})
                    end
                end
            end
            if data.current.value == 'trunk' then
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if ( IsPedSittingInAnyVehicle( playerPed ) ) then
                   if GetVehicleDoorAngleRatio(playerVeh, 5) > 0.0 then 
                      SetVehicleDoorShut(playerVeh, 5, false)
                      TriggerEvent("pNotify:SendNotification", {text = _U('closed_hood'), type = "error", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})
                    else
                      SetVehicleDoorOpen(playerVeh, 5, false)
                      frontleft = true
                      TriggerEvent("pNotify:SendNotification", {text = _U('opened_hood'), type = "success", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})    
                   end
                end
            end
            if data.current.value == 'dooravg' then
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if ( IsPedSittingInAnyVehicle( playerPed ) ) then
                   if GetVehicleDoorAngleRatio(playerVeh, 0) > 0.0 then 
                      SetVehicleDoorShut(playerVeh, 0, false)
                      TriggerEvent("pNotify:SendNotification", {text = _U('closed_door'), type = "error", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})
                    else
                      SetVehicleDoorOpen(playerVeh, 0, false)
                      frontleft = true
                      TriggerEvent("pNotify:SendNotification", {text = _U('opened_door'), type = "success", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})
                   end
                end
            end
            if data.current.value == 'dooravd' then
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if ( IsPedSittingInAnyVehicle( playerPed ) ) then
                   if GetVehicleDoorAngleRatio(playerVeh, 1) > 0.0 then 
                      SetVehicleDoorShut(playerVeh, 1, false)
                      TriggerEvent("pNotify:SendNotification", {text = _U('closed_door'), type = "error", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})
                    else
                      SetVehicleDoorOpen(playerVeh, 1, false)
                      frontleft = true
                      TriggerEvent("pNotify:SendNotification", {text = _U('opened_door'), type = "success", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})  
                   end
                end
            end
            if data.current.value == 'doorarg' then
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if ( IsPedSittingInAnyVehicle( playerPed ) ) then
                   if GetVehicleDoorAngleRatio(playerVeh, 2) > 0.0 then 
                      SetVehicleDoorShut(playerVeh, 2, false)
                      TriggerEvent("pNotify:SendNotification", {text = _U('closed_door'), type = "error", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})
                    else
                      SetVehicleDoorOpen(playerVeh, 2, false)
                      frontleft = true
                      TriggerEvent("pNotify:SendNotification", {text = _U('opened_door'), type = "success", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})     
                   end
                end
            end
            if data.current.value == 'doorard' then
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if ( IsPedSittingInAnyVehicle( playerPed ) ) then
                   if GetVehicleDoorAngleRatio(playerVeh, 3) > 0.0 then 
                      SetVehicleDoorShut(playerVeh, 3, false)
                      TriggerEvent("pNotify:SendNotification", {text = _U('closed_door'), type = "error", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})
                    else
                      SetVehicleDoorOpen(playerVeh, 3, false)
                      frontleft = true
                      TriggerEvent("pNotify:SendNotification", {text = _U('opened_door'), type = "success", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})
                   end
                end
            end
          end,
        function(data, menu)
          menu.close()
          OpenVehicleMenu()
        end
        )
      end
      if data.current.value == 'window' then
        ESX.UI.Menu.CloseAll()

        ESX.UI.Menu.Open(
          'default', GetCurrentResourceName(), 'window_actions',
          {
            title    = _U('window_menu'),
            align    = 'right',
            elements = {
              {label = _U('front_left_window'),   value = 'windowavga'},
              {label = _U('front_right_window'),   value = 'windowavdr'},
              {label = _U('back_left_window'),   value = 'windowarga'},
              {label = _U('back_right_window'),   value = 'windowardr'}
            }
          },
          function(data, menu)
            if data.current.value == 'windowavga' then
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if windowavg == false then
                      RollDownWindow(playerVeh, 0)
                      windowavg = true
                      TriggerEvent("pNotify:SendNotification", {text = _U('opened_window'), type = "error", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})
                else
                  RollUpWindow(playerVeh, 0)
                      windowavg = false
                  TriggerEvent("pNotify:SendNotification", {text = _U('closed_wondow'), type = "success", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})
                end
            end
            if data.current.value == 'windowavdr' then
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if windowavd == false then
                      RollDownWindow(playerVeh, 1)
                      windowavd = true
                  TriggerEvent("pNotify:SendNotification", {text = _U('opened_window'), type = "error", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})
                else
                  RollUpWindow(playerVeh, 1)
                      windowavd = false
                  TriggerEvent("pNotify:SendNotification", {text = _U('closed_wondow'), type = "success", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})
                end
            end
            if data.current.value == 'windowarga' then
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if windowarg == false then
                      RollDownWindow(playerVeh, 2)
                      windowarg = true
                  TriggerEvent("pNotify:SendNotification", {text = _U('opened_window'), type = "error", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})
                else
                  RollUpWindow(playerVeh, 2)
                      windowarg = false
                  TriggerEvent("pNotify:SendNotification", {text = _U('closed_wondow'), type = "success", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})
                end
            end
            if data.current.value == 'windowardr' then
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if windoward == false then
                      RollDownWindow(playerVeh, 3)
                      windoward = true
                  TriggerEvent("pNotify:SendNotification", {text = _U('opened_window'), type = "error", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})
                else
                  RollUpWindow(playerVeh, 3)
                      windoward = false
                  TriggerEvent("pNotify:SendNotification", {text = _U('closed_wondow'), type = "success", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})
                end
            end
          end,
        function(data, menu)
          menu.close()
          OpenVehicleMenu()
        end
        )
      end
      if data.current.value == 'cruise_control' then
        ESX.UI.Menu.CloseAll()

        ESX.UI.Menu.Open(
          'default', GetCurrentResourceName(), 'cruise_control_actions',
          {
            title    = _U('cruise_control'),
            align    = 'right',
            elements = {
              {label = _U('disabled'),   value = 'none'},
              {label = '30Km/h',    value = '30'},
              {label = '55Km/h',    value = '55'},
			  {label = '80Km/h',    value = '80'},
              {label = '110Km/h',   value = '110'},
			  {label = '150Km/h',   value = '150'},
			  {label = '170Km/h',   value = '170'},
			  {label = '200Km/h',   value = '200'},
            }
          },
          function(data, menu)
            if data.current.value == 'none' then
              local playerPed = GetPlayerPed(-1)
                local speedkm   = 999999
				local speed   = speedkm/3.6
				local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                SetEntityMaxSpeed(playerVeh, speed)
                TriggerEvent("pNotify:SendNotification", {text = "ยกเลิกการจำกัดความเร็ว", type = "info", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})
            end
            if data.current.value == '30' then
              local speedkm   = 30
              local speed   = speedkm/3.6
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                SetEntityMaxSpeed(playerVeh, speed)
                TriggerEvent("pNotify:SendNotification", {text = "กำหนดความเร็วที่ 30Km/h", type = "info", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})
            end
            if data.current.value == '55' then
              local speedkm   = 55
              local speed   = speedkm/3.6
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                SetEntityMaxSpeed(playerVeh, speed)
                TriggerEvent("pNotify:SendNotification", {text = "กำหนดความเร็วที่ 50Km/h", type = "info", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})
            end
			if data.current.value == '80' then
              local speedkm   = 80
              local speed   = speedkm/3.6
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                SetEntityMaxSpeed(playerVeh, speed)
                TriggerEvent("pNotify:SendNotification", {text = "กำหนดความเร็วที่ 80Km/h", type = "info", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})
            end
            if data.current.value == '110' then
              local speedkm   = 110
              local speed   = speedkm/3.6
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                SetEntityMaxSpeed(playerVeh, speed)
                TriggerEvent("pNotify:SendNotification", {text = "กำหนดความเร็วที่ 110Km/h", type = "info", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})
            end
			if data.current.value == '150' then
              local speedkm   = 150
              local speed   = speedkm/3.6
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                SetEntityMaxSpeed(playerVeh, speed)
                TriggerEvent("pNotify:SendNotification", {text = "กำหนดความเร็วที่ 150Km/h", type = "info", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})
            end
			if data.current.value == '170' then
              local speedkm   = 170
              local speed   = speedkm/3.6
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                SetEntityMaxSpeed(playerVeh, speed)
                TriggerEvent("pNotify:SendNotification", {text = "กำหนดความเร็วที่ 170Km/h", type = "info", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})
            end
			if data.current.value == '200' then
              local speedkm   = 200
              local speed   = speedkm/3.6
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                SetEntityMaxSpeed(playerVeh, speed)
                TriggerEvent("pNotify:SendNotification", {text = "กำหนดความเร็วที่ 200Km/h", type = "info", queue = "vehiclemenu", timeout = 1000, layout = "bottomcenter"})
            end
          end,
        function(data, menu)
          menu.close()
          OpenVehicleMenu()
        end
        )
      end
    end,
  function(data, menu)
    menu.close()
    OpenCivilianActionsMenu()
  end
  )
end

-- Close the ID card
-- Key events
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsControlPressed(0, 322) or IsControlPressed(0, 177) and cardOpen then
			SendNUIMessage({
				action = "close"
			})
			cardOpen = false
		end
	end
end)

Citizen.CreateThread(function()
  while true do
    Wait(0)
    if IsControlPressed(0, Keys["F5"]) then
      OpenCivilianActionsMenu()
    end
  end
end)

-- Bälte


local speedBuffer  = {}
local velBuffer    = {}
local beltOn       = false
local wasInCar     = false

IsCar = function(veh)
        local vc = GetVehicleClass(veh)
        return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
        end 

Fwv = function (entity)
        local hr = GetEntityHeading(entity) + 90.0
        if hr < 0.0 then hr = 360.0 + hr end
        hr = hr * 0.0174533
        return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
      end

Citizen.CreateThread(function()
  Citizen.Wait(500)
  while true do
    
    local ped = GetPlayerPed(-1)
    local car = GetVehiclePedIsIn(ped)
    
    if car ~= 0 and (wasInCar or IsCar(car)) then
    
      wasInCar = true
      
      if beltOn then DisableControlAction(0, 75) end

--      if beltOn and IsControlJustReleased(29)
--        TriggerEvent("pNotify:SendNotification", {text = "Du har bälte på dig!", type = "error", queue = "belt", timeout = 1000, layout = "bottomcenter"})
--      end
      
      speedBuffer[2] = speedBuffer[1]
      speedBuffer[1] = GetEntitySpeed(car)
      
      if speedBuffer[2] ~= nil 
         and not beltOn
         and GetEntitySpeedVector(car, true).y > 1.0  
         and speedBuffer[1] > 19.25 
         and (speedBuffer[2] - speedBuffer[1]) > (speedBuffer[1] * 0.255) then
         
        local co = GetEntityCoords(ped)
        local fw = Fwv(ped)
        SetEntityCoords(ped, co.x + fw.x, co.y + fw.y, co.z - 0.47, true, true, true)
        SetEntityVelocity(ped, velBuffer[2].x, velBuffer[2].y, velBuffer[2].z)
        Citizen.Wait(1)
        SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
      end
        
      velBuffer[2] = velBuffer[1]
      velBuffer[1] = GetEntityVelocity(car)
        
      if IsControlJustReleased(0, 29) then
        beltOn = not beltOn         
        if beltOn then  TriggerEvent("pNotify:SendNotification", {text = _U('seatbelt_on'), type = "success", queue = "belt", timeout = 1000, layout = "bottomcenter"})
        else TriggerEvent("pNotify:SendNotification", {text = _U('seatbelt_off'), type = "error", queue = "belt", timeout = 1000, layout = "bottomcenter"}) end
      end
      
    elseif wasInCar then
      wasInCar = false
      beltOn = false
      speedBuffer[1], speedBuffer[2] = 0.0, 0.0
    end
    Citizen.Wait(0)
  end
end)

local disableShuffle = true
function disableSeatShuffle(flag)
  disableShuffle = flag
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if IsPedInAnyVehicle(GetPlayerPed(-1), false) and disableShuffle then
      if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) == GetPlayerPed(-1) then
        if GetIsTaskActive(GetPlayerPed(-1), 165) then
          SetPedIntoVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
        end
      end
    end
  end
end)

RegisterNetEvent("SeatShuffle")
AddEventHandler("SeatShuffle", function()
  if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
    disableSeatShuffle(false)
    Citizen.Wait(5000)
    disableSeatShuffle(true)
  else
    CancelEvent()
  end
end)

RegisterCommand("shuff", function(source, args, raw) --change command here
    TriggerEvent("SeatShuffle")
end, false)
