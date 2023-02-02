-- Hilfsfunktion:
-- prüft ob ein bestimmtes Feld innerhalb einer komplexeren Tabelle exisitert

function table.isField(t, s)
    if t == nil then return false end
    local t = t
    for key in s:gmatch('[^.]+') do
        if t[key] == nil then return false end
        t = t[key]
    end
    return true
end