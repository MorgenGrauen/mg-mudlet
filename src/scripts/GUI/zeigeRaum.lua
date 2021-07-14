function zeigeRaum()

  ME.raum_kurz = gmcp.MG.room.info.short
  ME.raum_region = gmcp.MG.room.info.domain
  ME.raum_id = string.sub(gmcp.MG.room.info.id, 1, 5) 

  -- Para?

  if ME.para > 0 then
    ME.raum_region = "Para-" .. ME.raum_region
    r = 255
    g = 0
    b = 0
  else
    r = 30
    g = 30
    b = 30
  end

  -- Statuszeile aktualisieren

  GUI.spieler:echo(ME.name .. " [" .. ME.stufe .. "]")

  GUI.ort_raum:echo(ME.raum_kurz)
  GUI.ort_region:echo(ME.raum_region .. " [" .. ME.raum_id .. "]")

  GUI.ort_raum:setColor(r, g, b)
  GUI.ort_region:setColor(r, g, b)

end
