function ladeStartgebiet()
    -- Karte mit Startgebieten laden

    if istBereitsKarteVorhanden() then
        -- TODO: Da Spieler bereits aktiv war, hier die vorhandene Karte speichern, bevor sie unten überschrieben wird!
    end
    

    -- TODO: Passende Karte je nach Rasse laden. Nicht mehr die v8 Karte bereitstellen.
    loadMap(getMudletHomeDir() .. "/@PKGNAME@/" .. "map/anfaenger v8.dat")

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
        erstelleErstenRaum()
    end

    -- wegen initGMCP kommt gleich noch GMCP.MG.room zurück und wir wollen keinen weiteren Raum erstellen!
    local mode = mapper.mode
    if not (mode == "fix") then
        setMapperMode("fix")
        tempTimer(1, f"setMapperMode('{mode}')")
    end
end

function istBereitsKarteVorhanden()
    -- Prüft, ob Spieler bereits aktiv war, und Räume/Areas angelegt hatte, dann true, sonst false
    return not (table.is_empty(getRooms()) and table.is_empty(getAreaTableSwap()))
end