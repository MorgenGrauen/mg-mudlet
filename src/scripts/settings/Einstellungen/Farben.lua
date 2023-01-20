
farben = {}
farben.vg = 
  { komm = "cyan",
    ebenen = "hot_pink",
    info = "green",
    alarm = "white",
    script = "dark_green",
    gag = "dark_slate_gray" }
farben.hg = 
  { komm = "black",
    ebenen = "black",
    info = "black", 
    alarm = "red",
    script = "black",
    gag = "black" }

-- komm: Kommunikation wie teile-mit
-- ebenen: Einfaerben der "normalen" Ebenen
-- info: Einfaerben von Informationen des Muds (Status Gegner)
-- alarm: Alarm-Nachrichten
-- script: Nachrichten, die nicht vom Mud, sondern von einem Script stammen.
-- gag: fast (!) unsichtbar auf schwarzem Hintergrund für unwichtigere Spieltexte.

-- Einstellungen fuer Farben Kampfscroll

function msg (type, what)
  -- setzt VG und HG je nach Typ der Kommunikation
  local vg = farben.vg[type]
  local hg = farben.hg[type]

  if vg and hg then
      cecho("<"..vg..":"..hg..">"..what)
  else
    echo(what)
  end
end
                    
                