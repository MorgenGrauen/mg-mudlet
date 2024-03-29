
mapper.exitmap =
    { n = 1
    , no = 2
    , nw = 3
    , o = 4
    , w = 5
    , s = 6
    , so = 7
    , sw = 8
    , ob = 9
    , u = 10
    , rein = 11
    , raus = 12
    , [1] = "n"
    , [2] = "no"
    , [3] = "nw"
    , [4] = "o"
    , [5] = "w"
    , [6] = "s"
    , [7] = "so"
    , [8] = "sw"
    , [9] = "ob"
    , [10] = "u"
    , [11] = "rein"
    , [12] = "raus"
    , norden = 1
    , nordosten = 2
    , nordwesten = 3
    , osten = 4
    , westen = 5
    , sueden = 6
    , suedosten = 7
    , suedwesten = 8
    , oben = 9
    , unten = 10
}

mapper.intexitmap =
    { north = 1
    , northeast = 2
    , northwest = 3
    , east = 4
    , west = 5
    , south = 6
    , southeast = 7
    , southwest = 8
    , up = 9
    , down = 10
    , ["in"] = 11
    , out = 12
    , [1] = "north"
    , [2] = "northeast"
    , [3] = "northwest"
    , [4] = "east"
    , [5] = "west"
    , [6] = "south"
    , [7] = "southeast"
    , [8] = "southwest"
    , [9] = "up"
    , [10] = "down"
    , [11] = "in"
    , [12] = "out"
    , n = 1
    , ne = 2
    , nw = 3
    , e = 4
    , w = 5
    , s = 6
    , se = 7
    , sw = 8
}

-- Der ganze Kram hier ist dazu da, verschiedene Repraesentationen der
-- Standardausgaenge ineinander zu konvertieren. Standardausgaenge
-- koennen auf drei Arten repraesentiert sein:
--
-- * Loc(al):    Die deutschen Abkuerzungen, die auch im MUD verwendet werden.
-- * Int(ernal): Englische Langversionen ("east", "west", etc.). Wird z.B. von
--               getRoomExits zurueckgegeben.
-- * Num(eric):  Numerische Repraesentationen der Standardausgaenge von 1-12
--               (siehe mapper.exitmap und mapper.intexitmap)

function exitNum2Int(n) return mapper.intexitmap[n] end
function exitNum2Loc(n) return mapper.exitmap[n] end
function exitInt2Loc(n) return mapper.exitmap[mapper.intexitmap[n]] end
function exitInt2Num(n) return mapper.intexitmap[n] end
function exitLoc2Int(n) return mapper.intexitmap[mapper.exitmap[n]] end
function exitLoc2Num(n) return mapper.exitmap[n] end

function isSpecialExit(name) return mapper.exitmap[name] == nil end
function isSpecialIntExit(name) return mapper.intexitmap[name] == nil end

-- Zur Positionierung neuer Raeume. Weist jeder Standardrichtung ein
-- Koordinatendelta zu.
function getExitCoordinates(name)
    local d = mapperconf.scale
    local exitCoordinates =
        { n =          {  0,  d,  0 }
        , norden =     {  0,  d,  0 }
        , no =         {  d,  d,  0 }
        , nordosten =  {  d,  d,  0 }
        , o =          {  d,  0,  0 }
        , osten =      {  d,  0,  0 }
        , so =         {  d, -d,  0 }
        , suedosten =  {  d, -d,  0 }
        , s =          {  0, -d,  0 }
        , sueden =     {  0, -d,  0 }
        , sw =         { -d, -d,  0 }
        , suedwesten = { -d, -d,  0 }
        , w =          { -d,  0,  0 }
        , westen =     { -d,  0,  0 }
        , nw =         { -d,  d,  0 }
        , nordwesten = { -d,  d,  0 }

        , ob =         {  0,  0,  1 }
        , oben =       {  0,  0,  1 }
        , u =          {  0,  0, -1 }
        , unten =      {  0,  0, -1 }

        , nob =           {  0,  d,  1 }
        , nordoben =      {  0,  d,  1 }
        , noob =          {  d,  d,  1 }
        , nordostoben =   {  d,  d,  1 }
        , oob =           {  d,  0,  1 }
        , ostoben =       {  d,  0,  1 }
        , soob =          {  d, -d,  1 }
        , suedostoben =   {  d, -d,  1 }
        , sob =           {  0, -d,  1 }
        , suedoben =      {  0, -d,  1 }
        , swob =          { -d, -d,  1 }
        , suedwestoben =  { -d, -d,  1 }
        , wob =           { -d,  0,  1 }
        , westoben =      { -d,  0,  1 }
        , nwob =          { -d,  d,  1 }
        , nordwestoben =  { -d,  d,  1 }

        , nu =            {  0,  d, -1 }
        , nordunten =     {  0,  d, -1 }
        , nou =           {  d,  d, -1 }
        , nordostunten =  {  d,  d, -1 }
        , ou =            {  d,  0, -1 }
        , ostunten =      {  d,  0, -1 }
        , sou =           {  d, -d, -1 }
        , suedostunten =  {  d, -d, -1 }
        , su =            {  0, -d, -1 }
        , suedunten =     {  0, -d, -1 }
        , swu =           { -d, -d, -1 }
        , suedwestunten = { -d, -d, -1 }
        , wu =            { -d,  0, -1 }
        , westunten =     { -d,  0, -1 }
        , nwu =           { -d,  d, -1 }
        , nordwestunten = { -d,  d, -1 }
    }
    return exitCoordinates[name] or { 0, 0, 0 }
end

-- Baut (je nach Name) einen Standard- oder Spezialausgang.
function addAnyExit(src, tgt, name)
    if name == "" then
      return true
    end
    if isSpecialExit(name) then
        addSpecialExit(src, tgt, name)
        echoM("Erstelle speziellen Ausgang.\n  Quelle: " .. src .. "\n  Ziel:   " .. tgt .. "\n  Befehl: " .. name)
    else
        setExit(src, tgt, exitLoc2Num(name))
        echoM("Erstelle Ausgang.\n  Quelle: " .. src .. "\n  Ziel:   " .. tgt .. "\n  Befehl: " .. name)
    end
end

-- Sucht in einem Raum nach einem Ausgang mit einem bestimmten Namen.
function getAnyExit(room, name)
    if isSpecialExit(name) then
        return getSpecialExitsSwap(room)[name]
    else
        return getRoomExits(room)[exitLoc2Int(name)]
    end
end

function addStubExit(src, name)
    -- Debug: -- echoM("Prüfe Stub.  Start: " .. src .. "  Befehl: " .. name )
    if getAnyExit(src, name) then
        -- Debug: echoM("Befehl '" .. name .. "' uebersprungen, da bereits ein Ausgang dorthin vorlag.")
        return
    end
    if isSpecialExit(name) then
        -- Ausgänge wie "nordunten" werden (noch) nicht unterstützt
        -- Debug: echoM("Befehl '" .. name .. "' uebersprungen, nicht in ueblicher Richtung.")
        return
    end
    -- Debug: echoM("Erstelle Stub.  Befehl: " .. name)
    setExitStub(src, exitLoc2Num(name), true)
end

-- Erstellt einen neuen Raum mit Area und Hash und gibt eine Meldung aus.
function createRoom(area, hash)
    local newRoom = createRoomID()
    addRoom(newRoom)
    setRoomArea(newRoom, findArea(area))

    if hash ~= nil then 
        setRoomIDbyHash(newRoom, hash) 
    else
        -- just für die folgende Meldung...
        hash = "ohne Hash"
    end

    echoM("Erstelle Raum.\n  Area: " .. area .. "\n  Hash: " .. hash)
    return newRoom
end