-- Mit "#haus<name>" ein Seherhaus aufschliessen und betreten; 
-- wird der Name weggelassen, wird automatisch ME.name angehaengt.

local wessen = matches[2] 

-- Leerzeichen entfernen - http://lua-users.org/wiki/StringTrim
wessen = wessen:match'^()%s*$' and '' or wessen:match'^%s*(.*%S)'

if wessen == "" then wessen = ME.name end

if wessen then
    send("schliesse haus von " .. wessen .. " auf")
    send("oeffne haus von " .. wessen)
    send("betrete haus von " .. wessen)
    send("schliesse haus von " .. wessen)
    send("schliesse haus von " .. wessen .. " ab")
end
