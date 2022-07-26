function initGUI()

  -- Textfenster begrenzen
  setBorderTop(0)
  setBorderBottom(25) -- bisschen Platz fuer Statuszeile
  setBorderLeft(0)
  setBorderRight(0)

  -- Statuszeile malen. Layout wie folgt:
  -- Vorher:
  -- Zeile 1: spieler (Name, Stufe), gift, trenner_1, vorsicht (Vorsicht, Fluchtrichtung)
  -- Zeile 2: ort_raum (Region, Raumnummer, Para), ort_region (Ort kurz)
  -- Zeile 3: lp_titel, lp_anzeige (Lebenspunkte-Anzeige), kp_titel, kp_anzeige (KP-Anzeige), trenner_2

  -- Bald:
  -- Zeile 1: ort_raum (Region, Raumnummer, Para), ort_region (Ort kurz)

  GUI.statuszeile = Geyser.Container:new({name = "statuszeile", x=0, y=-30, width = 600, height=30})

  --[[ 
  -- Zeile 1 (vorher)
  
  GUI.spieler = Geyser.Label:new({
    name = "spieler",
    x = 0, y = -65,
    width = 150, height = 20}, GUI.statuszeile)

  GUI.gift = Geyser.Label:new({
    name = "gift",
    x = 150, y = -65,
    width = 50, height = 20}, GUI.statuszeile)

  GUI.trenner_1 = Geyser.Label:new({
    name = "trenner_1",
    x = 200, y = -65,
    width = 50, height = 20}, GUI.statuszeile)

  GUI.vorsicht = Geyser.Label:new({
    name = "vorsicht",
    x = 250, y = -65,
    width = 350, height = 20}, GUI.statuszeile)

  -- Zeile 2 (vorher)

  ]]--

  -- Zeile 1 (neu)
  GUI.ort_raum = Geyser.Label:new({
    name = "ort_raum",
    x = 250, y = -25,
    width = 350, height = 20}, GUI.statuszeile)

  GUI.ort_region = Geyser.Label:new({
    name = "ort_region",
    x = 0, y = -25,
    width = 250, height = 20}, GUI.statuszeile)

  --[[
  -- Zeile 3 (vorher)
  GUI.lp_titel = Geyser.Label:new({
    name = "lp_titel",
    x = 0, y = -25,
    width = 100, height = 20}, GUI.statuszeile)
  GUI.lp_titel:echo("Lebenspunkte:")

  GUI.lp_anzeige = Geyser.Gauge:new({
    name = "lp_anzeige",
    x = 100, y = -25, 
    width = 140, height = 20}, GUI.statuszeile)
  GUI.lp_anzeige:setColor(0, 255, 50) 

  GUI.kp_titel = Geyser.Label:new({
    name = "kp_titel",
    x = 240, y = -25,
    width = 110, height = 20}, GUI.statuszeile)
  GUI.kp_titel:echo("&amp;nbsp;Konzentration:")

  GUI.kp_anzeige = Geyser.Gauge:new({
    name = "kp_anzeige",
    x = 350, y = -25,
    width = 150, height = 20}, GUI.statuszeile)
  GUI.kp_anzeige:setColor(0, 50, 250)

  GUI.trenner_2 = Geyser.Label:new({
    name = "trenner_2",
    x = 500, y = -25,
    width = 100, height = 20}, GUI.statuszeile)
  ]]--

end
