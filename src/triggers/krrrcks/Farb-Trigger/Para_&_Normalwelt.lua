-- Prüfung über Portal 23

if (matches[3] == "gruenlich") then
    faerbeZeile("info")
    ME.para = 0
elseif (matches[3] == "roetlich") then
    faerbeZeile("alarm")
    ME.para = 1
end

zeigeRaum()