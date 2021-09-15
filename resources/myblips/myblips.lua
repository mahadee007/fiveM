local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},
	{title="Pig", colour=8, id=141, x = 2392.94, y = 5025.97, z = 46.06}, -- Location to obtain supplies needed to make cocaine at Drug Processing Location
	{title="Sellpig", colour=8, id=431, x = 68.04, y = 179.75, z = 106.61}, -- Location to obtain supplies needed to make LSD at Drug Processing Location
	{title="Monkey", colour=50, id=141, x = -769.23773193359, y = 5595.6215820313, z = 33.48571395874}, -- Location of Money Laundering
	{title="SellMonkey", colour=50, id=500, x = 258.8, y = -1801.18, z = 27.11}, -- Location to obtain supplies needed to make LSD at Drug Processing Location
	{title="Deer", colour=16, id=141, x = -1029.62, y = 4224.05, z = 117.32}, -- Location of Money Laundering
	{title="SellDeer", colour=16, id=500, x = -976.51, y = -1433.2, z = 7.68}, -- Location to obtain supplies needed to make LSD at Drug Processing Location
  }

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.7)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end

end)
