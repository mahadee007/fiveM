local delay = 1000 * 20 * 1 -- 1000 millisecond x 20 = 20000 millisecond (20000 millisecond = 20 Second)

-- สคริปนี้ ทำงานแค่ครั้งเดียวแล้วจะปิดตัวเองลงทันทีที่ทำงานเสร็จ -- ถ้าหากอยากให้รีสตาร์ทเรื่อยๆให้ เซ็ตเวลาให้เหมาะสม แล้ว ลบ break ทิ้ง
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(delay) 
        ExecuteCommand("restart scotty-crafting")		
        ExecuteCommand("restart scotty-crafting1")		
      --  ExecuteCommand("restart ชื่อสคริปที่ต้องการตั้งรีสตาร์ท")		

		break
    end
end)