
-- Entfernt Mudlets "generic mapper" Paket, das uns stört
uninstallPackage("generic_mapper")

mudlet = mudlet or {}
mudlet.mapper_script = true

mapper = mapper or {}

mapper.mode = mapper.mode or "fix"
mapper.currentHash = mapper.currentHash or nil
mapper.currentArea = mapper.currentArea or "world"

-- Den aktuellen Raum und Regionsinfos in der Karte anzeigen
registerMapInfo("Rauminfos", function() 
    local raum_name = ME.raum_kurz
    local region_infos = f"{ME.raum_region} [{ME.raum_id}]"
    local r, g, b = 200, 200, 200
    if ME.para > 0 then r, g, b = unpack(color_table.tomato) end
    return f"{raum_name}\n{region_infos}", false, false, r, b, g
end)
enableMapInfo("Rauminfos")

-- Den aktuellen Kartenmodus in der Karte anzeigen
registerMapInfo("Kartenmodus", function() 
    if mapper.mode == "fix" then
        return "Karte wird NICHT automatisch erweitert", false, true, 200, 200, 200
    else
        return "Karte wird automatisch erweitert", false, true, 200, 200, 200
    end
end)
enableMapInfo("Kartenmodus")


 -- Standard-Anzeige im Mudlet-Mapper wird dann nicht benötigt
disableMapInfo("Short")
disableMapInfo("Full")

function echoM(str)
    fg(mapperconf.color)
    echo("[MAPPER] " .. str .. "\n")
    resetFormat()
end