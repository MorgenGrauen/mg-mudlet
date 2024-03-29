-- Aendert den Mapper Mode und gibt eine entsprechende Meldung aus.
function setMapperMode(mode)
    if mode == "fix" or mode == "auto" then
        if mode == mapper.mode then
            echoM("Mapper-Modus war bereits: " .. mode)
        else
            echoM("Aendere Mapper-Modus nach: " .. mode)
            mapper.mode = mode
            updateMap() -- nur für die Anzeige vom Kartenmodus
        end
    else
        echoM("Aktueller Modus: '" .. mapper.mode .. "'")
        echoM("Moegliche Modus: 'fix' und 'auto'")
    end
end
