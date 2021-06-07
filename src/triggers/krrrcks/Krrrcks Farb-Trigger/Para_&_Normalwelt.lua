-- Prüfung über Portal 23

selectCurrentLine()

if (matches[3] == "gruenlich") then
    fg(farben.vg.info)
    bg(farben.hg.info)

    ME.para = 0
end

if (matches[3] == "roetlich") then
    fg(farben.vg.alarm)
    bg(farben.hg.alarm)
    ME.para = 1
end

zeigeRaum()
resetFormat()
