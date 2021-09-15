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
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}

ESX = nil
local display = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function isWeapon(item)
	local weaponList = ESX.GetWeaponList()
	for i=1, #weaponList, 1 do
		if weaponList[i].label == item then
			return true
		end
	end
	return false
end

local function craftItem(ingredients)
	local ingredientsPrepped = {}
	for name, count in pairs(ingredients) do
		if count > 0 then
			table.insert(ingredientsPrepped, { item = name , quantity = count})
		end
	end
	TriggerServerEvent('w1ms_craft:craftItem', ingredientsPrepped)
end

RegisterNetEvent('w1ms_craft:openMenu')
AddEventHandler('w1ms_craft:openMenu', function(playerInventory)
	SetNuiFocus(true,true)
	local preppedInventory = {}
	local itemc = {}
	local wname = {}
	for i=1, #playerInventory, 1 do
		if playerInventory[i].count > 0 and not isWeapon(playerInventory[i].label) then
			table.insert(preppedInventory, playerInventory[i])
		end
	end
	for k,v in pairs(Config.Recipes) do
		table.insert(wname, { name = k})
	end

	for k,v in pairs(Config.Recipes) do

		for s,ingredient in pairs(Config.Recipes[k]) do
			table.insert(itemc, { name = k , itemneed = ingredient.item,itemqu=ingredient.quantity})
		end
	end

	SendNUIMessage({
		inventory = preppedInventory,
		wave = itemc,
		wname = wname,
		craftprice = Config.CraftingPrice,
		display = true
	})
	display = true
end)


RegisterNUICallback('craftItemNUI', function(data, cb)
	local playerPed = PlayerPedId()
	exports['progressBars']:startUI(10000, "กำลังคราฟไอเท็ม")
	TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
	Citizen.Wait(10000)
	ClearPedTasksImmediately(playerPed)
	craftItem(data)
end)

RegisterNUICallback('NUIFocusOff', function()
	SetNuiFocus(false, false)
	SendNUIMessage({
		display = false
	})
	display = false
end)

if Config.Keyboard.useKeyboard then
	-- Handle menu input
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			if IsControlJustReleased(1, Config.Keyboard.keyCode) and GetLastInputMethod(2) then
				TriggerServerEvent('w1ms_craft:getPlayerInventory')
			end
		end
	end)
end

if Config.Shop.useShop then
	local inDrawingRange = false
	local function isPlayerInRange(coords1, coords2, range)	
		return (Vdist2(coords1.x, coords1.y, coords1.z, coords2.x, coords2.y, coords2.z) < range)
	end
	
	Citizen.CreateThread(function()
		local blip = AddBlipForCoord(Config.Shop.shopCoordinates.x, Config.Shop.shopCoordinates.y, Config.Shop.shopCoordinates.z)
		SetBlipSprite (blip, Config.Shop.shopBlipID)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 1.0)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Config.Shop.shopName)
		EndTextCommandSetBlipName(blip)
		
		while true do
			Citizen.Wait(250)
			inDrawingRange = isPlayerInRange(GetEntityCoords(PlayerPedId()), Config.Shop.shopCoordinates, 100)
		end
	end)
		
	Citizen.CreateThread(function()		
		while true do
			Citizen.Wait(0)
			if inDrawingRange then
				DrawMarker(1, Config.Shop.shopCoordinates.x, Config.Shop.shopCoordinates.y, Config.Shop.shopCoordinates.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Shop.zoneSize.x, Config.Shop.zoneSize.y, Config.Shop.zoneSize.z, Config.Shop.zoneColor.r, Config.Shop.zoneColor.g, Config.Shop.zoneColor.b, Config.Shop.zoneColor.a, false, true, 2, false, false, false, false)
				if not display and isPlayerInRange(GetEntityCoords(PlayerPedId()), Config.Shop.shopCoordinates, Config.Shop.zoneSize.x) then
					SetTextComponentFormat('STRING')
					AddTextComponentString("Press ~INPUT_CONTEXT~ to craft an item")
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
					if IsControlJustReleased(1, 38) then
						TriggerServerEvent('w1ms_craft:getPlayerInventory')
					end
				end
			end
		end
	end)
end

--[[local NPC = { x=962.5, y=-1585.5, z=29.6, rotation = 200, NetworkSync = true}
Citizen.CreateThread(function()
  modelHash = GetHashKey("UPS01SMM")
  RequestModel(modelHash)
  while not HasModelLoaded(modelHash) do
       Wait(1)
  end
  createNPC() 
end)
function createNPC()
	created_ped = CreatePed(0, modelHash , NPC.x,NPC.y,NPC.z - 1, NPC.rotation, NPC.NetworkSync)
	FreezeEntityPosition(created_ped, true)
	SetEntityInvincible(created_ped, true)
	SetBlockingOfNonTemporaryEvents(created_ped, true)
	TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_COP_IDLES", 0, true)
end

function SpawnProps()
	while Propsno < Config.Props do
		Citizen.Wait(0)
		for index, value in pairs(Config.AnimalPositions) do
			local Animal = CreatePed(5, GetHashKey(Config.animalname), 962.5, -1585.5, 29.6, 0.0, true, false)
			--DrawMarker(20, value.x, value.y, value.z+1.5, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 240,230,140, 165, 1,0, 0,1)	
			--DrawMarker(20, value.x, value.y, value.z+1.5, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 0.5, 0.5, 0, 255, 0, 100, false, true, 2, false, false, false, false)
		  	
			
			--TaskWanderStandard(Animal, true, true)
			--SetEntityAsMissionEntity(Animal, true, true)
			table.insert(Props, Animal)
			Propsno = Propsno + 1
			Citizen.Wait(500)
			FreezeEntityPosition(Animal, true)
			SetEntityInvincible(Animal,true)
			SetEntityOnlyDamagedByPlayer(Animal, false)
			SetEntityCanBeDamaged(Animal, false)
			SetPedCanRagdoll(Animal, false)
			ClearPedBloodDamage(Animal)
			ResetPedVisibleDamage(Animal)
		end
		
	end

end]]