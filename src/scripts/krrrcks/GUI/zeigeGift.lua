function zeigeGift()
  if not (GUI.gift and table.is_field(gmcp, "MG.char.vitals")) then return end

  ME.gift = gmcp.MG.char.vitals.poison
  local zeile = ""

  -- vergiftet?

  if ME.gift == 0 then
    r = 30
    g = 30
    b = 30
  else  -- Farbuebergang gelb->orange->rot 
    r = 255
    g = 255 - ME.gift * 25
    b = 0
    zeile = "<black>G I F T"
  end

  -- Statuszeile aktualisieren

  GUI.gift:echo(zeile)
  GUI.gift:setColor(r, g, b)

end
