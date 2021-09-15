Config = {}
Config["debug"] = true -- เปิดปิดโหมดพัฒนา (ใช้เพื่อเปิดคำสั่ง sc_bench)
Config["craft_duration"] = 5 -- เวลาที่ใช้ในการคราฟเริ่มต้น
Config["craft_duration_multiply"] = true -- จะคูณเวลาไหมหากมีการคราฟมากกว่า 1 ชิ้น
Config["craft_duration_max"] = 30 -- กำหนดเวลาคราฟสูงสุดหากเกินกว่าค่า จะถูกตั้งกลับเป็นค่านี้ ตั้งเป็น nil หรือลบบรรทัดนี้ออกหากอยากปลดล็อค
Config["craft_enable_fail"] = true -- เปิดปิดอัตราคราฟล้มเหลว 
Config["craft_cost"] = 0 -- เสียเงินเวลาสร้างไหม ปรับเป็น 0 หากไม่เสีย
Config["craft_table"] = {
	{
		position = {x = 225.0, y = -801.62, z = 29.63, h = 73.64},
		max_distance = 2.0, -- ระยะที่สามารถใช้โต๊ะได้
		map_blip = true,
		blip_name = "Pachatipad Carft Table"
	},
}

--[[
	ทุกครั้งที่มีการต่อเพิ่มในตารางอย่าลืมใส่ , ที่ปีกกาปิดของอันเก่า
	
	ตัวอย่างการเพิ่ม หมวด
	[1] = { -- ต้องใช้เป็นเลขใหม่ต่อท้ายหมวดเก่า
		name = "หมวดทั่วไป", -- ชื่อหมวด
		animation = { -- เพิ่มอนิเมชั้นเองโดยเปลี่ยนทั้งหมวด ลบหากต้องการใช้แบบธรรมดา
			dict = "world_human_welding",
			anim = "world_human_welding",
			flag = 30
		},
		list = { -- สำหรับเพิ่มไอเทม ต้องใส่ภายในปีกกาเท่านั้น
		}
	}
		
	ตัวอย่างการเพิ่ม ไอเทมลงในหมวด
	{
		item = "cloth", --ชื่อของไอเทม
		fail_chance = 15, --โอกาสที่จะล้มเหลวเวลาคราฟ
		amount = 3, --เมื่อคราฟแล้วจะได้กี่ชิ้น
		cost = 500, -- เพิ่มราคาคราฟ ถ้าไม่มีจะยึดจาก Config["craft_cost"]
		
		craft_duration = 10, -- สำหรับปรับเวลาที่จะใช้คราฟของชิ้นนี้
		
		animation = { -- เพิ่มอนิเมชั้นเองโดยเปลี่ยนแค่ชิ้นนี้ สามารถลบออกได้ถ้าไม่ต้องการ
			dict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger",
			flag = 30
		},
		
		equipment = { -- ถ้าต้องมีอุปกรณ์บางชิ้นก่อนถึงใส่ได้ให้เพิ่ม ถ้าไม่มีให้ลบออก
			["scissors"] = true, -- => true คือ เปิด false คือปิด
			["pro_wood"] = false -- ทั้งหมดหมายความว่าต้องการแค่กรรไกรในการคราฟ
		},
		
		blueprint = { -- ลิสของที่ต้องการ => ["ชื่อของไอเทม"] = @จำนวนที่ใช้
			["leather"] = 1, -- => หนังสัตว์ 1 ชิ้น
			["wood"] = 2 -- => ไม้ 2 ท่อน
		},
	},
]]

Config["category"] = {
	
	[1] = {
				name = "ไอเท็มทั่วไป",
	list = 	{
				{
					item = "membercard",
					fail_chance = 70,
					amount = 1,
					cost = 50,
					craft_duration = 10,
					blueprint = {
						["steel_bar"] = 10,
						["licencard"] = 1
					},
					equipment = {
						["water"] = false,
					}
				},
				{
					item = "gps",
					fail_chance = 50,
					amount = 1,
					cost = 50,
					craft_duration = 10,
					blueprint = {
						["steel_bar"] = 10,
						["spring"] = 5,
						["bottle"] = 1
					},
					equipment = {
						["water"] = false,
					}
				},
				{
					item = "lockpick",
					fail_chance = 95,
					amount = 1,
					cost = 50,
					craft_duration = 10,
					blueprint = {
						["copper_bar"] = 5,
						["spring"] = 5,
						["diamond"] = 1,
						["cement"] = 3
					},
					equipment = {
						["water"] = false,
					}
				},
				{
					item = "thermite",
					fail_chance = 60,
					amount = 1,
					cost = 50,
					craft_duration = 10,
					blueprint = {
						["bottle"] = 1,
						["cement"] = 15,
						["marijuana"] = 15
					},
					equipment = {
						["water"] = false,
					}
				}	
			}
	},
}

Config["translate"] = {
	you_crafted = "คุณได้ทำการสร้าง %s จำนวน %d ชิ้น!",
	not_enough = "ส่วนประกอบไม่เพียงพอ",
	not_enough2 = "กรุณาเตรียมส่วนประกอบให้พร้อม",
	you_blow = "คุณล้มเหลวในการสร้าง %s",
	no_equipment = "คุณไม่มีอุปกรณ์",
	no_equipment2 = "ต้องใช้อุปกรณ์ในการคราฟของชิ้นนี้",
	no_money = "เงินไม่เพียงพอ",
	no_money2 = "คุณต้องการเงิน $%s ในการคราฟ"
}