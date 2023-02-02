function zeigeRaum()

  local roomData = gmcp.MG.room.info
  ME.raum_kurz = roomData.short
  ME.raum_region = roomData.domain
  ME.raum_id = string.sub(roomData.id, 1, 5) 

  -- Para?

  if ME.para > 0 then
    ME.raum_region = "Para-" .. ME.raum_region
    r, g, b = 255, 0, 0
  else
    r, g, b = 30, 30, 30
  end

  -- Statuszeile aktualisieren

  GUI.spieler:echo(ME.name .. " [" .. ME.stufe .. "]")

  GUI.ort_raum:echo(ME.raum_kurz)
  GUI.ort_region:echo(ME.raum_region .. " [" .. ME.raum_id .. "]")

  GUI.ort_raum:setColor(r, g, b)
  GUI.ort_region:setColor(r, g, b)

end
