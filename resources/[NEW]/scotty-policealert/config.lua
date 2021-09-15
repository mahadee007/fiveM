

Config = {}
Config["base_key"] = 19 
Config["base_key_text"] = "ALT" 
Config["duration"] = 15 
Config["red_radius"] = 60.0 

Config["alert_section"] = {
	carjacking = false,
	cement = false,
	gunshot = true,
	drug = true,
	fishing = true,
	burglary = true,
	thief = true,
	honey = true,
}

-- การ Setup โดยการวาง Event ที่ระบบหลัก
-- ถ้าเป็นไฟล์ Client ให้ TriggerEvent("scotty-policealert:alertNet", "thief") -- เปลี่ยน event ได้
-- ถ้าเป็นไฟล์ Server ให้ TriggerClientEvent("scotty-policealert:getalertNet", source, "thief") -- เปลี่ยน event ได้

--Possible Value: top topLeft topCenter topRight bottom bottomLeft bottomCenter bottomRight center centerLeft centerRight
Config["alert_position"] = "topLeft" 

Config["translate"] = {
	title = "",
	male = "ผู้ชาย",
	female = "ผู้หญิง",
	text = "มี <span style=\"color:red;\">%s</span> คนหนึ่งกำลัง %s อยู่ที่ <span style=\"color:green;\">%s</span>",
	tip = "เพื่อมาร์คไปยังจุดเกิดเหตุ",
	action_carjacking = "จรกรรมรถยนต์",
	action_melee = "ทำร้ายร่างกายใครบางคน",
	action_gunshot = "ยิงปืนไม่ทราบชนิด",
	action_fishing = "ตกปลาผิดกฏหมาย",
	action_burglary = "กำลังคราฟอาวุธ",
	action_drug = "ขายยาเสพติด",
	action_honey = "เก็บรังผึ้ง",
	action_thief = "ปล้นใครบางคน"
}