Citizen.CreateThread(function()
    SetMapZoomDataLevel(0, 0.96, 0.9, 0.08, 0.0, 0.0) -- Level 0
    SetMapZoomDataLevel(1, 1.6, 0.9, 0.08, 0.0, 0.0) -- Level 1
    SetMapZoomDataLevel(2, 8.6, 0.9, 0.08, 0.0, 0.0) -- Level 2
    SetMapZoomDataLevel(3, 12.3, 0.9, 0.08, 0.0, 0.0) -- Level 3
    SetMapZoomDataLevel(4, 22.3, 0.9, 0.08, 0.0, 0.0) -- Level 4
end)

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(1)
		if IsPedOnFoot(GetPlayerPed(-1)) then 
			SetRadarZoom(1100)
		elseif IsPedInAnyVehicle(GetPlayerPed(-1), true) then
			SetRadarZoom(1100)
		end
    end
end)
-- Added in by HXVRMXN below

DisableMapOnFoot = true -- false to show minimap on foot and in a car or true to hide the minimap only on foot but show in a car.

Citizen.CreateThread(function()
    while true do
		local player = GetPlayerPed(-1)
		local InCar = IsPedInAnyVehicle(player, true)
		Citizen.Wait(50)
	    if InCar then
		  DisplayRadar(true)
		else
		  DisplayRadar(false)
        end
    end
end)