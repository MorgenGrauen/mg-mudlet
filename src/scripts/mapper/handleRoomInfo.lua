
-- Handler fuer gmcp.MG.room.info
-- Hier werden Raeume gebaut, Ausgaenge verbunden und die aktuelle Position in der Map
-- gesetzt.
function handleRoomInfo()
    if not table.is_field(gmcp, "MG.room.info") then return end

    local roomData = gmcp.MG.room.info
    local hash = roomData.id

    -- Manchmal kam das irgendwie doppelt. Fangen wir hier ab.
    if hash == mapper.currentHash then
        return true
    end

    mapper.currentHash = hash

    local exitname = command
    local knownRoom = getRoomIDbyHash(hash)

    if mapper.mode == "auto" then
        -- Raeume ohne Raum-ID kann der Automapper nicht.
        if hash == "" or hash == nil then
            echoM("Keine Raum-ID gefunden. Deaktiviere auto-mapper.")
            setMapperMode("fix")
            return true
        end

        mapper.synchronized = false

        if knownRoom == -1 then
            -- Neuer Raum ist nicht bekannt. Erstelle Raum und entsprechenden Ausgang

            local needsUpdate = getRoomHashByID(mapper.currentRoom) == nil
            local newRoom

            if needsUpdate then
                -- wir befinden uns wahrschenlich im ersten erstellten Raum, der allerdings
                -- ein Sonderraum war...

                newRoom = mapper.currentRoom
                
                setRoomArea(newRoom, findArea(mapper.currentArea))

                setRoomIDbyHash(newRoom, hash)
    
                echoM("Aktualisiere Raum.\n  Area: " .. mapper.currentArea .. "\n  Hash: " .. hash)
            else
                newRoom = createRoom(mapper.currentArea, hash)
            end

            local roomName = roomData.short
            setRoomName(newRoom, roomName)

            if not needsUpdate then
                -- bei Raumupdates brauchen wir keine neuen Koordinaten setzen
                local x,y,z = getRoomCoordinates(mapper.currentRoom)
                local dx,dy,dz = getExitCoordinates(exitname)
                setRoomCoordinates(newRoom, x+dx, y+dy, z+dz)

                -- auch brauchen wir keinen Ausgang, haben ja den Raum auf der Karte nicht gewechselt
                addAnyExit(mapper.currentRoom, newRoom, exitname)
            end

            mapper.currentRoom = newRoom
        else
            -- Neuer Raum ist bekannt. Erstelle nur einen Ausgang.

            if not getAnyExit(mapper.currentRoom, exitname) then
                addAnyExit(mapper.currentRoom, knownRoom, exitname)
            end

            mapper.currentRoom = knownRoom
            mapper.currentArea = getRoomAreaName(getRoomArea(mapper.currentRoom))
        end
        
        -- im neuen Raum alle sichtbaren Ausgänge prüfen und ggf. Stubs erzeugen
        for _, exitname in pairs(roomData.exits) do
            addStubExit(mapper.currentRoom, exitname)
        end
        
    elseif mapper.mode == "fix" then
        -- fix-Modus. Nur den aktuellen Raum setzen.
        if knownRoom > -1 then
            mapper.currentRoom = knownRoom
            mapper.currentArea = getRoomAreaName(getRoomArea(mapper.currentRoom))
        end
    end
    centerview(mapper.currentRoom)
end
                    
            