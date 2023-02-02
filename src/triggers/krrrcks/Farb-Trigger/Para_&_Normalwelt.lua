-- Prüfung über Portal 23

if (matches[3] == "gruenlich") then
    zeile_faerben("info")
    ME.para = 0
elseif (matches[3] == "roetlich") then
    zeile_faerben("alarm")
    ME.para = 1
end

zeigeRaum()