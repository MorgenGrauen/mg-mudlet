
-- Aendert den Mapper Mode und gibt eine entsprechende Meldung aus.
function setMapperMode(mode)
    if mode == "fix" or mode == "auto" then
        echoM("Aendere Mapper-Modus nach: " .. mode)
        mapper.mode = mode
    else
        echoM("Fehler: Unbekannter Modus: '" .. mode .. "'")
    end
end
                    
            