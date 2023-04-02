-- Setzt die Karte auf Werkszustand zurueck.
function minit()
    -- TODO: Sollte zukünftig zuerst noch Rasse prüfen und passende Karte laden, usw. wie ladeStartgebiet()
    local success = loadJsonMap(f"{getMudletHomeDir()}/MorgenGrauen/map/leer.json")
    if not success then
        echoM("Leere Karte laden fehlgeschlagen! :(")
        return
    end

    if table.is_field(gmcp, "MG.room.info") then
        erstelleErstenRaumAusGmcpDaten()
    else
        -- keine Raumdaten vorhanden
        mapper.currentRoom = 1
        mapper.currentHash = "?"
        mapper.currentArea = "Welt"
        centerview(1)
    end

    echoM("Neue Karte initialisiert.")
    setMapperMode("auto")

end

function erstelleErstenRaumAusGmcpDaten()
    local roomData = gmcp.MG.room.info
    local hash = roomData.id

    mapper.currentHash = hash

    local newRoom = createRoom(mapper.currentArea, hash)

    setRoomName(newRoom, roomData.short)

    -- im neuen Raum alle sichtbaren Ausgänge prüfen und ggf. Stubs erzeugen
    for _, exitname in pairs(roomData.exits) do
        addStubExit(newRoom, exitname)
    end

    mapper.currentRoom = newRoom
    centerview(newRoom)
end