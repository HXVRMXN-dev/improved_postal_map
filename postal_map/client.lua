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

function hideminimap()
    DisplayRadar(false);
end

function showminimap()
    DisplayRadar(true);
end

-- Added in by HXVRMXN below

DisableMapOnFoot = true -- false to show minimap on foot and in a car or true to hide the minimap only on foot but show in a car.
Citizen.CreateThread(function()
    while DisableMapOnFoot do
  	 local player = PlayerPedId()
  	 local InCar = IsPedInAnyVehicle(player, true)

  	    if not IsEntityDead(player) then
    	 Wait(0)

    	    if not InCar then
    			hideminimap()
    		else
    			showminimap()
    		end
    	end
    else
    	Wait(500)
    end
end)




