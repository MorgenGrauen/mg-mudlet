-- Einstellungen fuer Farben im Scroll

-- komm: Kommunikation wie teile-mit
-- ebenen: Einfaerben der "normalen" Ebenen
-- info: Einfaerben von Informationen des Muds (Status Gegner)
-- alarm: Alarm-Nachrichten
-- script: Nachrichten, die nicht vom Mud, sondern von einem Script stammen.
-- gag: fast (!) unsichtbar auf schwarzem Hintergrund für unwichtigere Spieltexte.
-- mapper: Mitteilungen des Mappers

local farben = farben or
{ vg =
  { komm = "cyan",
    info = "green",
    alarm = "white",
    script = "dark_green",
    gag = "dark_slate_gray",
    mapper = "royal_blue"
  },
  hg =
  {
    alarm = "red"
  }
}

local function bestimmeFarben(type)
  local vg = farben.vg[type]
  local hg = farben.hg[type] or "black"
  return vg, hg
end

--- Setzt Vordergrund- und Hintergrundfarbe je nach Typ der Kommunikation, und schreibt dann den Text in bunt
function faerbeText(type, text)
  local vg, hg = bestimmeFarben(type)
  if vg and hg then
    cecho("<"..vg..":"..hg..">"..text)
  else
    echo(text)
  end
end

--- Ändert Vordergrund- und Hintergrundfarbe der aktuellen (ganzen) Zeile je nach Typ der Kommunikation
-- Keine Ahnung, ob das besser geht, aber ich will die ganze Zeile einfärben und nicht nur den "Match".
function faerbeZeile(type)
  local vg, hg = bestimmeFarben(type)
  if vg and hg then
    selectCurrentLine()
    fg(vg)
    bg(hg)
    resetFormat()
  end
end

--- Ändert Vordergrund- und Hintergrundfarbe der (bereits vorher erfolgten) Auswahl je nach Typ der Kommunikation
function faerbeAuswahl(type)
  local vg, hg = bestimmeFarben(type)
  if vg and hg then
    fg(vg)
    bg(hg)
    resetFormat()
  end
end

--- Setzt Vordergrund- und Hintergrundfarbe je nach Typ der Kommunikation, und gibt dann den Text in bunt zurück für cecho()
function liefereFarbigenText(type, text)
  local vg, hg = bestimmeFarben(type)
  if vg and hg then
    return("<"..vg..":"..hg..">"..text)
  end
  return(text)
end

--- Setzt Namen von Spieler und Ebene im gegebenen Text bunt für hecho()
-- Pattern muss [ und ] escapen mit % da hier Lua Regex zugrunde liegt
-- Das ] ist absichtlich nicht enthalten, damit Emotes erkannt werden.
-- @param text Text einer Ebene inkl. Senderkennung wie: [Tod:Lars] Huhu!
-- @param spieler Wer schreibt auf der Ebene? Bspw. Lars
-- @param ebene Auf welcher Ebene wird geschrieben? Bspw. Tod
-- @return farbigerText Derselbe Text, nur in Farbe!
function liefereFarbigeEbene(text, spieler, ebene)
  local pattern = f"%[{ebene}:{spieler}"
  local colored_text = f"[{color_text_for_hecho(ebene)}:{color_text_for_hecho(spieler)}"
  return text:gsub(pattern, colored_text)
end

--- Färbt den gegebenen Text in seine einzigartige Farbe (vorbereitet zur Ausgabe per hecho())
-- Inspiration, um Farben aus Text abzuleiten:
-- - https://stackoverflow.com/questions/3426404/create-a-hexadecimal-colour-based-on-a-string-with-javascript
-- - https://stackoverflow.com/questions/68317097/how-to-properly-convert-hsl-colors-to-rgb-colors-in-lua
-- @param text Beliebiger Text, der gefärbt werden soll
-- @return farbigerText Derselbe Text, nur in Farbe! Am Ende wird Format zurückgesetzt.
function color_text_for_hecho(text)
  local red, green, blue = string_to_color(text)
  local hecho_format = f"#{math.DecToHex(red)}{math.DecToHex(green)}{math.DecToHex(blue)}{text}#r"
  return hecho_format
end

--- Give a string, and receive always the same but random color for it (in hecho() format)
-- @param string_input What text you want to get a color for
-- @param[opt=100] saturation How saturated the color should become
-- @param[opt=75] lightness How light the new color should become
function string_to_color(string_input, saturation, lightness)
  local hash = 0
  local saturation = saturation or 100
  local lightness = lightness or 75
  for i = 1, #string_input do
    hash = string.byte(string_input, i) + ((hash * 32) - hash)
  end
  local hue = hash % 360
  local red, green, blue = HSL_to_RGB(hue, saturation, lightness)
  return red, green, blue
end

--- Convert a color from HSL format to RGB format
-- @param hue Given in a range from 0 to 360
-- @param saturation Given in a range from 0 to 100
-- @param lightness Given in a range from 0 to 100
-- @return red Given in a range from 0 to 255
-- @return green Given in a range from 0 to 255
-- @return blue Given in a range from 0 to 255
function HSL_to_RGB(hue, saturation, lightness)
    local h = hue / 360
    local s = saturation / 100
    local l = lightness / 100
    local r, g, b;

    if s == 0 then
        r, g, b = l, l, l; -- achromatic
    else
        local function hue2rgb(p, q, t)
            if t < 0 then t = t + 1 end
            if t > 1 then t = t - 1 end
            if t < 1 / 6 then return p + (q - p) * 6 * t end
            if t < 1 / 2 then return q end
            if t < 2 / 3 then return p + (q - p) * (2 / 3 - t) * 6 end
            return p;
        end

        local q = l < 0.5 and l * (1 + s) or l + s - l * s;
        local p = 2 * l - q;
        r = hue2rgb(p, q, h + 1 / 3);
        g = hue2rgb(p, q, h);
        b = hue2rgb(p, q, h - 1 / 3);
    end

    return math.round(r * 255), math.round(g * 255), math.round(b * 255)
end

--- Rundet auf/ab, anstatt einfach nur ab wie math.floor()
-- @param num Die zu rundende Zahl
-- @param numDecimalPlaces[opt=0] Anzahl der Dezimalstellen
-- @return roundedNumber Die auf-/abgerundete Zahl
function math.round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

--- Wandelt eine Dezimalzahl in eine Hexadezimalzahl um
-- @param num Die zu wandelnde Dezimalzahl
-- @return numAsHex Die hexadezimale Darstellung der Zahl als String
function math.DecToHex(num)
  return string.format("%x", num)
end
