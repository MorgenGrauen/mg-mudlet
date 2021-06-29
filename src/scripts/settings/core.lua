-- Paketversion für Thirdparty Skripte speichern
MG_Version = getPackageInfo("MorgenGrauen", "version")

-- Gedöns... weil Tippfaul
local MG_DBName = "MG_Settings"

-- Eine Einstellung setzen, index sollte sich dabei aus der Optionsgruppe
-- und dem Namen der Option, getrennt durch "."
-- 
-- z.B. "mapper.scale" oder "ui.showMapper"

function setConfig(index, value)
    local valueType = type(value)
    if valueType == "table" then
        -- Tabelle in Json String umwandeln
        value = yajl.to_string(value)
    end
    
    local result, err = db:add(MG_DB.config, {
        name = index, value = value, type = valueType
    })
  
    if not result then
        display(result, err)
    end
end

-- Eine Einstellung abfragen, oder falls nicht vorhanden defaultValue zurückgeben

function getConfig(index, defaultValue)
    local row = db:fetch(MG_DB.config, db:eq(MG_DB.config.name, index))
    
    if #row == 1 then
        local value = row[1].value
        local valueType = row[1].type
      
        if valueType == "number" then
            return tonumber(value)
        elseif valueType == "boolean" then
            if value == "0" then return false end
            return true
        elseif valueType == "table" then
            -- Json in Lue Tabelle umwandeln
            return yajl.to_value(value)
        elseif valueType == "nil" then
            return nil
        end
        
        -- Wir können mit dem Optionstypen nichts anfangen, also als String zurückgeben
        return value
    end

    -- Kein Eintrag in den Einstellungen gefunden, also ersteinmal einen erstellen
    -- falls defaultValue nicht nil ist...
    if defaultValue ~= nil then
        setConfig(index, defaultValue)    
    end

    return defaultValue
end

db:create(MG_DBName, {
    config = {
        name = "", 
        value = "", 
        type = "",
        _index = {"name"},
        _unique = {"name"},
        _violations = "REPLACE"
    }
})

MG_DB = db:get_database(MG_DBName)

