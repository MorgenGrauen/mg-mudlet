
farben = farben or
{ vg =
  { komm = "cyan",
    ebenen = "hot_pink",
    info = "green",
    alarm = "white",
    script = "dark_green",
    gag = "dark_slate_gray"
  },
  hg =
  { komm = "black",
    ebenen = "black",
    info = "black",
    alarm = "red",
    script = "black",
    gag = "black" }
}
-- komm: Kommunikation wie teile-mit
-- ebenen: Einfaerben der "normalen" Ebenen
-- info: Einfaerben von Informationen des Muds (Status Gegner)
-- alarm: Alarm-Nachrichten
-- script: Nachrichten, die nicht vom Mud, sondern von einem Script stammen.
-- gag: fast (!) unsichtbar auf schwarzem Hintergrund für unwichtigere Spieltexte.

-- Einstellungen fuer Farben Kampfscroll

function faerbeText(type, text)
  -- setzt Vordergrund- und Hintergrundfarbe je nach Typ der Kommunikation, und schreibt dann den Text in bunt
  local vg = farben.vg[type]
  local hg = farben.hg[type]
  if vg and hg then
    cecho("<"..vg..":"..hg..">"..text)
  else
    echo(text)
  end
end

function faerbeZeile(type)
  -- ändert Vordergrund- und Hintergrundfarbe der aktuellen (ganzen) Zeile je nach Typ der Kommunikation
  -- Keine Ahnung, ob das besser geht, aber ich will die ganze Zeile einfärben und nicht nur den "Match".
  local vg = farben.vg[type]
  local hg = farben.hg[type]
  if vg and hg then
    selectCurrentLine()
    fg(vg)
    bg(hg)
    resetFormat()
  end
end

function faerbeAuswahl(type)
  -- ändert Vordergrund- und Hintergrundfarbe der (bereits vorher erfolgten) Auswahl je nach Typ der Kommunikation
  local vg = farben.vg[type]
  local hg = farben.hg[type]
  if vg and hg then
    fg(vg)
    bg(hg)
    resetFormat()
  end
end

function liefereFarbigenText(type, text)
  -- setzt Vordergrund- und Hintergrundfarbe je nach Typ der Kommunikation, und schreibt dann den Text in bunt
  local vg = farben.vg[type]
  local hg = farben.hg[type]
  if vg and hg then
    return("<"..vg..":"..hg..">"..text)
  end
  return(text)
end