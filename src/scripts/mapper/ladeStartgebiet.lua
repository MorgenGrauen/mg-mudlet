function ladeStartgebiet()
    -- Karte mit Startgebiet der aktuellen Rasse laden

    if GUI and GUI.StartgebietGeladen then return end

    -- Rasse bekannt?
    if not table.is_field(gmcp, "MG.char.base") then
        -- Rasse unbekannt. Warte auf passendes GMCP Event, dann starte diese Funktion nochmal einmalig von vorne. Jetzt aber Abbruch!
        echoM("Kann noch kein Startgebiet anzeigen, weil noch kein Spieler eingeloggt ist. Warte...")
        registerAnonymousEventHandler("gmcp.MG.char.base", ladeStartgebiet, true)
        return
    end

    -- Ggf. Backup vorab?
    if not istKarteLeer() then
        echoM("Es war bereits eine Karte vorhanden. Speichere Backup, bevor sie überschrieben wird...")
        local datetimestamp = getTime(true, "yyyy-MM-dd_hh-mm-ss")
        local success = saveMap(f"{getMudletHomeDir()}/map/Backup_{datetimestamp}.dat")
        if not success then
            echoM("Backup fehlgeschlagen! Breche ab. :(")
            return
        end
        echoM("Backup erfolgreich!")
    end

    -- Lade Karte passend zur Rasse
    local race = string.lower(gmcp.MG.char.base.race)
    local bekannteKarten = { "dunkelelf", "elf", "feline", "goblin", "hobbit", "mensch", "ork", "zwerg" }
    local success = false
    if table.contains(bekannteKarten, race) then
        echoM(f"Lade Karte des ({race}-bekannten) Startgebietes...")
    else
        echoM(f"Unbekannte Rasse: {race}. Lade leere Karte ohne Startgebiet...")
        race = "leer"
    end
    success = loadJsonMap(f"{getMudletHomeDir()}/MorgenGrauen/map/{race}.json")
    if success then
        echoM("Laden erfolgreich.")
    else
        echoM("Laden fehlgeschlagen! :(")
        return
    end

    -- Wo befinden wir uns gerade auf der geladenen Karte?
    local aktuellePositionIstImStartgebiet = false
    if table.is_field(gmcp, "MG.room.info") then
        local hash = gmcp.MG.room.info.id
        -- Ganze Karte prüfen, ob wir unseren Hash wiederfinden
        for roomID, _ in pairs(getRooms()) do
            if hash == getRoomHashByID(roomID) then
                aktuellePositionIstImStartgebiet = true
                mapper.currentRoom = roomID
                mapper.currentHash = hash
                mapper.currentArea = getRoomArea(roomID)
                echoM("Aktuelle Position auf Karte gefunden. Blende Gebiet ein...")
                centerview(roomID)
                break
            end
        end
    end

    if not aktuellePositionIstImStartgebiet then
        -- Jedes geladene Startgebiet hat einen Raum mit Nummer 1, von dem aus dann gestartet werden kann.
        echoM("Aktuelle Position nicht auf Karte gefunden. Starte auf leerer Karte...")
        mapper.currentRoom = 1
        mapper.currentHash = "?"
        mapper.currentArea = "Welt"
        centerview(1)
    end

    -- FIXME: wegen initGMCP kommt gleich noch GMCP.MG.room zurück und wir wollen keinen weiteren Raum erstellen!
    local mode = mapper.mode
    if mode ~= "fix" then
        setMapperMode("fix")
        tempTimer(1, f"setMapperMode('{mode}')")
    end

    setMapZoom(5)

    GUI = GUI or {}
    GUI.StartgebietGeladen = true
end

function istKarteLeer()
    -- Prüft, ob Spieler bereits aktiv war, und mehr als einen Raum angelegt hatte, dann true, sonst false
    -- Normalerweise startet ein Spieler mit einem Raum und einer Area (default) oder zwei Areas (per minit)
    return not (#table.keys(getRooms()) > 1 and #table.keys(getAreaTableSwap()) > 2)
end