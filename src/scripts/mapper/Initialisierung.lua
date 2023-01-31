
-- Entfernt Mudlets "generic mapper" Paket, das uns stört
uninstallPackage("generic_mapper")

mudlet = mudlet or {}
mudlet.mapper_script = true

mapper = mapper or {}

mapper.mode = mapper.mode or "fix"
mapper.currentHash = mapper.currentHash or nil
mapper.currentArea = mapper.currentArea or "world"

-- Einstellmöglichkeiten

getConfig("mapper.roomDistance", 2)
getConfig("mapper.messageColor", "royal_blue")
getConfig("mapper.showMap", true)

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
    fg(getConfig("mapper.messageColor", "royal_blue"))
    echo("[MAPPER] " .. str .. "\n")
    resetFormat()
end