function zeigeVitaldaten()
  
  if not (gmcp.MG.char.vitals and gmcp.MG.char.maxvitals) then return end

  -- GMCP Vitaldaten merken

  ME.lp = gmcp.MG.char.vitals.hp
  ME.lp_max = gmcp.MG.char.maxvitals.max_hp
  local lp_anzeigetext = "<b> " .. ME.lp .. "/" .. ME.lp_max .. "</b> "
  
  ME.kp_max = gmcp.MG.char.maxvitals.max_sp
  local kp_anzeigetext
  -- Vielleicht hat der Spieler noch keinen KP-Report!
  if gmcp.MG.char.vitals.sp then
    ME.kp = gmcp.MG.char.vitals.sp
    kp_anzeigetext = "<b> " .. ME.kp .. "/" .. ME.kp_max .. "</b> "
  else
    ME.kp = ME.kp_max
    kp_anzeigetext = "<b> max. " .. ME.kp .. "</b> "
  end

  -- Werte der Balken aktualisieren
  GUI.lp_anzeige:setValue(ME.lp, ME.lp_max, lp_anzeigetext)
  GUI.kp_anzeige:setValue(ME.kp, ME.kp_max, kp_anzeigetext)

  -- Treffer? Dann LP Balken blinken lassen

  if ME.lp < ME.lp_alt then
    -- echo("Au!")
    lp_anzeige_blinken(0.2)
  else
    if not GUI.lp_anzeige_blinkt then
      lp_anzeige_faerben()
    end
  end
  ME.lp_alt = ME.lp

end

function lp_anzeige_faerben()

  -- Je nach LP Verlust wird Farbe gruen/gelb/rot

  local lp_quote = ME.lp / ME.lp_max
  GUI.lp_anzeige:setColor(255 * (1 - lp_quote), 
                          255 * lp_quote, 
                          50)
end

function lp_anzeige_blinken(dauer)

  GUI.lp_anzeige_blinkt = true
  GUI.lp_anzeige:setColor(255, 0, 50) -- rot
  tempTimer(dauer, [[ lp_anzeige_entblinken() ]])

end

function lp_anzeige_entblinken()

  GUI.lp_anzeige_blinkt = false
  lp_anzeige_faerben()

end
