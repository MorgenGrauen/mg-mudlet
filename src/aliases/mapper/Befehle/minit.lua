
-- Dies setzt die Karte auf Werkszustand zurueck.

for i,name in pairs(getRooms()) do
    deleteRoom(i)
end

addRoom(1)
setRoomArea(1, findArea("world"))
setRoomIDbyHash(1, mapper.currentHash)
mapper.currentRoom = 1
centerview(1)

echoM("Neue Map initialisiert.")
                    
                