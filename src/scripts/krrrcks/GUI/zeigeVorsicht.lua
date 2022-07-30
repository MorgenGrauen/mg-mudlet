function zeigeVorsicht()

  if gmcp.MG.char.wimpy and gmcp.MG.char.wimpy.wimpy and gmcp.MG.char.wimpy.wimpy_dir then 
    ME.vorsicht = gmcp.MG.char.wimpy.wimpy
    ME.fluchtrichtung = gmcp.MG.char.wimpy.wimpy_dir
  
    -- Prinz Eisenherz?
  
    if ME.vorsicht == 0 then
      ME.vorsicht = "NIX"
    end
  
    local zeile = "Vorsicht: " .. ME.vorsicht
  
    -- Fluchtrichtung anzeigen, nur wenn gesetzt
  
    if ME.fluchtrichtung ~= 0 then
      zeile = zeile .. ", FR: " .. ME.fluchtrichtung
    end
  
    -- Statuszeile aktualisieren
  
    GUI.vorsicht:echo(zeile)
  end
end
