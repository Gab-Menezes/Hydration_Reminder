local waterVol = 0
local on = true

function drink_water()
    if on then
        waterVol = waterVol + 25
        show_volume()
    end
end

function show_volume()
    local volume = 0
    local metric = ""
    if waterVol >= 1000 then
        volume = waterVol/1000
        metric = "L"
    else
        volume = waterVol
        metric = "ml"
    end
    mp.osd_message("Water volume: " .. volume .. metric, 1)
end

function on_off()
    on = not on
	mp.osd_message("Hydration reminder", 1)
    if on then
        mp.osd_message("hydration reminder: ON", 1)
    else
        mp.osd_message("hydration reminder: OFF", 1)
    end
end

timer = mp.add_periodic_timer(3*60, drink_water)
mp.add_key_binding("'", "show_volume", show_volume)
mp.add_key_binding("\"", "on_off", on_off)
