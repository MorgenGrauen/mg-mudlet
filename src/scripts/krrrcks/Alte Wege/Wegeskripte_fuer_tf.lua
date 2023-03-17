function alt_dopath(wegestring)
  if not type(wegestring) == "string" then
        wegestring = ""
    end
    for w in string.gmatch(wegestring, "%a+") do
      send(w)
    end
end

function alt_ws(kommandos, lang)
    if not type(kommandos) == "table" then
        kommandos = {}
    end
    if not lang then
        send("ultrakurz")
    end
    for k,v in ipairs(kommandos) do
        -- Wenn "#dopath" oder "#go", dann das Ali ausführen
        if (type(v) == "string" and string.sub(v, 1, 7) == "#dopath")
            or (type(v) == "string" and string.sub(v, 1, 3) == "#go") 
       then 
            expandAlias(v)
        else    
        -- sonst ohne Ali Ersetzung senden (erst mal keine weiteren Ersetzungen
        -- vorgesehen.
            send(v)
        end
    end
    if not lang then
        send("lang")
        send("schau")
    end
end
