-- Dieses Alias setzt die Karte auf Werkszustand zurueck.

-- vorhandene Räume löschen
for id, _ in pairs(getRooms()) do
    deleteRoom(id)
end

-- vorhandene Gebiete löschen, ausser "Default Area"
for _, id in pairs(getAreaTable()) do
    if id > -1 then
        deleteArea(id)
    end
end

-- currentArea zurücksetzen damit wir wirklich von vorne anfangen
mapper.currentArea = "world"
mapper.currentHash = nil

-- MapUserData löschen
clearMapUserData()

if table.is_field(gmcp, "MG.room.info") then
    -- ersten Raum aus aktuellen GMCP Daten erstellen
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
else
    -- keine Raumdaten vorhanden
    local newRoom = createRoom(mapper.currentArea, mapper.currentHash)
    
    setRoomName(newRoom, "Irgendwo im Nirgendwo")

    mapper.currentRoom = newRoom
    centerview(newRoom)
end

echoM("Neue Karte initialisiert.")
setMapperMode("auto")
