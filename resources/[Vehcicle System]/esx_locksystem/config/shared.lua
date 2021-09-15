----------------------
-- Author : Deediezi
-- Version 4.5
--
-- Contributors : No contributors at the moment.
--
-- Github link : https://github.com/Deediezi/FiveM_LockSystem
-- You can contribute to the project. All the information is on Github.

-- Global configuration file

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

Config = {
	Locale = "en",
	notification = 1,				-- 0 = Disable | 1 = LockSystem notification | 2 = chatMessage notification
	key = Keys["999"],				-- เปลี่ยนคีย์ที่ใช้กดล็อครถ เมื่ออยู่ในรถ
	disableCar_NPC = false,			-- ถ้าอยากให้ขับรถ NPC ได้ก็ตั้งเป็น false
	lockTimer = 1,					-- ระยะเวลาคูลดาวน์เวลากดรีโมท
	randomMsg =	{
		"You found an extra set of keys in the glove compartment.",
		"You found an extra set of keys in the center console.",
		"You found an extra set of keys under the driver\'s seat.",
	}
}

-- ตั้งค่าระบบ Scotty Key
sConfig = {
	on_death = 0, -- 0 = ไม่ดรอปกุญแจอยู่ถาวรจนกว่าจะดรอปเอง, 1 = กุญแจหายหมดตอนตาย, 2 = ดรอปกุญแจตอนตาย
	inventory_remote_range = 30.0, -- ระยะรีโมท
	extra_key_cost = 250, -- สร้างกุญแจต้องใช้เงินไหมหรือเท่าไร
	extra_key_cooldown = 60, -- ระยะเวลาถึงจะสร้างอันต่อไปได้
	get_extra_key_cmd = "createcarkey", -- คำสั่ง /createcarkey หรือเปลี่ยนได้ สำหรับปั้มกุญแจจากรถ (ต้องเป็นเจ้าของรถ) ตั้งเป็น nil หรือ เว้นว่างหากไม่ต้องการ
	get_extra_key = Keys["U"], -- สำหรับปั้มกุญแจจากรถ (ต้องเป็นเจ้าของรถ) 
	translate = {
		you_gave = "ได้ได้มอบกุญแจรถ %s ให้แก่ %s",
		you_received = "คุณได้รับกุญแจรถ %s จาก %s",
		create_not_owned = "ไม่สามารถสร้างกุญแจได้ เนื่องจากไม่ใช่เจ้าของรถ",
		you_create_key = "คุณได้สร้างกุญแจรถ %s",
		key_full = "กุญแจรถสามารถมีได้ชิ้นเดียวต่อหนึ่งคันในช่องเก็บของ",
		cooldown_create_key = "สามารถสร้างได้ใหม่ในอีก %d วินาที",
		not_enough_money = "เงินไม่พอที่จะสร้างกุญแจต้องการ %d",
		car_not_found = "ไม่พบรถ %s ในระยะ",
		drop_name = "%s KEY",
		notification_name = "[%s] KEY"
	}
}