local waterVol = 0

function drink_water()
    waterVol = waterVol + 25
    show_volume()
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

timer = mp.add_periodic_timer(60*3, drink_water)
mp.add_key_binding("'", "show_volume", show_volume)
