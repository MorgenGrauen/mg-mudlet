function ladeStartgebiet()
    -- Karte mit Startgebieten laden
    -- TODO: Alles folgende in eigenes Skript auslagern, das von hier aufgerufen wird.

    -- TODO: Passende Karte je nach Rasse laden. Nicht mehr die v8 Karte bereitstellen.
    loadMap(getMudletHomeDir() .. "/@PKGNAME@/" .. "map/anfaenger v8.dat")
    -- TODO: Vorab eine ggf. vorhandene Karte speichern, falls Spieler bereits aktiv war!

    -- Wo befinden wir uns gerade auf der geladenen Karte?
    local found = false
    local hash = gmcp.MG.room.info.id -- TODO: prüfen, gibt es das überhaupt schon?
    local currentRoom
    local currentHash
    -- Ganze Karte prüfen, ob wir unseren Hash wiederfinden
    for id, _ in pairs(getRooms()) do
        if hash == getRoomHashByID(id) then
        currentRoom = id
        currentHash = getRoomHashByID(id)
        found = true
        end
    end

    if found then
        -- Ah, wir sind in einem Startgebiet. Dann Mapper dorthin ausrichten!
        mapper.currentHash = currentHash
        mapper.currentRoom = currentRoom
        mapper.currentArea = getRoomArea(currentRoom)
        centerview(currentRoom)

    else
        -- Sonst irgendwo anders einen neuen Raum anlegen, von dem aus kartographiert werden kann.
        -- TODO: Ist vmtl. so nicht nötig, da Map für diesen Zweck bereits einen Raum "1" enthält!
        mapper.currentArea = "world"

        -- Folgendes 1:1 aus neuem Alias "minit" kopiert 
        -- TODO: dort und hier in gemeinsame Funktion auslagern!
        do
        -- ersten Raum aus aktuellen GMCP Daten erstellen
        hash = gmcp.MG.room.info.id

        mapper.currentHash = hash

        local newRoom = createRoom(mapper.currentArea, hash)
        local roomName = gmcp.MG.room.info.short
        setRoomName(newRoom, roomName)

        -- im neuen Raum alle sichtbaren Ausgänge prüfen und ggf. Stubs erzeugen
        for _, exitname in pairs(gmcp.MG.room.info.exits) do
            addStubExit(newRoom, exitname)
        end

        mapper.currentRoom = newRoom
        centerview(newRoom)

        end
        -- Ende "minit"
    end

    -- wegen initGMCP kommt gleich noch GMCP.MG.room zurück und wir wollen keinen weiteren Raum erstellen!
    local mode = mapper.mode
    if not (mode == "fix") then
        setMapperMode("fix")
        tempTimer(1, f"setMapperMode('{mode}')")
    end
end