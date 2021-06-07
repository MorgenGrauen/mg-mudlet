
-- Sucht die Area-ID fuer eine Area bzw. erstellt bei bedarf
-- eine neue Area.
function findArea(name)
    local areas = getAreaTable()
    if areas[name] == nil then
        return addAreaName(name)
    else
        return areas[name]
    end
end
                    
            