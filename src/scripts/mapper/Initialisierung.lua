
-- Entfernt Mudlets "generic mapper" Paket, das uns stört
uninstallPackage("generic_mapper")

mudlet = mudlet or {}
mudlet.mapper_script = true

mapper = mapper or {}

mapper.mode = mapper.mode or "fix"
mapper.currentHash = mapper.currentHash or nil
mapper.currentArea = mapper.currentArea or "world"

-- Den aktuellen Kartenmodus in der Karte anzeigen
registerMapInfo("Kartenmodus", function() 
    if mapper.mode == "fix" then
        return "", false, true, unpack(color_table.tomato)
    else
        return "Kartenmodus: automatisch erweitern", false, true, unpack(color_table.tomato)
    end
end)
enableMapInfo("Kartenmodus")

function echoM(str)
    -- TODO: Mit faerbeText() harmonisieren..!
    -- TODO: Mapper-Infos in Debug-Tab hinter Mapper verschieben?
    fg(mapperconf.color)
    echo("[MAPPER] " .. str .. "\n")
    resetFormat()
end