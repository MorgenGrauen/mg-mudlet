-- Dies setzt die Karte auf Werkszustand zurueck.

-- Sonderfälle, behandeln wir irgendwann in der Zukunft
if gmcp.MG.room.info == nil or gmcp.MG.room.info.id == nil then
    echoM("Bitte begebe dich in einen anderen Raum und versuche es noch einmal! Habe derzeit keinerlei Informationen ueber deinen aktuellen Standort im MorgenGrauen :(")
    return
end

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

-- MapUserData löschen
clearMapUserData()

-- ersten Raum aus aktuellen GMCP Daten erstellen
local hash = gmcp.MG.room.info.id

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

echoM("Neue Karte initialisiert.")