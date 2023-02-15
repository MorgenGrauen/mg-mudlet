
-- Entfernt Mudlets "generic mapper" Paket, das uns stört
uninstallPackage("generic_mapper")

mudlet = mudlet or {}
mudlet.mapper_script = true

mapper = mapper or {}

mapper.mode = mapper.mode or "auto"
mapper.currentHash = mapper.currentHash or nil
mapper.currentArea = mapper.currentArea or "world"

-- Die aktuellen Rauminfos in der Karte anzeigen
registerMapInfo("Raum", function() 
    local raum_name = ME.raum_kurz
    local r, g, b = 200, 200, 200
    if ME.para > 0 then r, g, b = unpack(color_table.tomato) end
    return raum_name, false, false, r, b, g
end)
enableMapInfo("Raum")

-- Die aktuellen Regionsinfos in der Karte anzeigen
registerMapInfo("Region", function()
    local r, g, b = 200, 200, 200
    local region_infos = nil
    if ME.raum_region and ME.raum_id then
      region_infos = f"{ME.raum_region} [{ME.raum_id}]"
      if ME.para > 0 then r, g, b = unpack(color_table.tomato) end
    end
    return region_infos, false, false, r, b, g
end)
disableMapInfo("Region")

-- Den aktuellen Kartenmodus in der Karte anzeigen
registerMapInfo("Modus", function() 
    local mapper_modus = (mapper.mode == "fix") and 
        "Karte wird NICHT automatisch erweitert" or
        "Karte wird automatisch erweitert"
    return mapper_modus, false, true, 200, 200, 200
end)
disableMapInfo("Modus")

 -- Standard-Anzeige im Mudlet-Mapper wird dann nicht benötigt
disableMapInfo("Short")
disableMapInfo("Full")

function echoM(str)
    -- TODO: Mit faerbeText() harmonisieren..!
    -- TODO: Mapper-Infos in Debug-Tab hinter Mapper verschieben?
    fg(mapperconf.color)
    echo("[MAPPER] " .. str .. "\n")
    resetFormat()
end
