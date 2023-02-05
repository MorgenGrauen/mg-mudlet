function zeigeVorsicht()
  if not table.is_field(gmcp, "MG.char.wimpy") then return end

  local wimpyData = gmcp.MG.char.wimpy
  ME.vorsicht = wimpyData.wimpy
  ME.fluchtrichtung = wimpyData.wimpy_dir

  -- Prinz Eisenherz?

  if ME.vorsicht == 0 then
    ME.vorsicht = "NIX"
  end

  local zeile = "Vorsicht: " .. ME.vorsicht

  -- Fluchtrichtung anzeigen, nur wenn gesetzt

  if ME.fluchtrichtung and ME.fluchtrichtung ~= "" then
    zeile = zeile .. ", FR: " .. ME.fluchtrichtung
  end

  -- Statuszeile aktualisieren

  GUI.vorsicht:echo(zeile)
end
