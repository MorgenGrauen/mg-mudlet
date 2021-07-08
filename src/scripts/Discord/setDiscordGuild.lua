local symbole = {
  kaempfer = "schwerter",
  abenteurer = "kompass",
  zauberer = "zauberer",
  chaos = "teufel",
  urukhai = "ork",
  bierschuettler = "bier",
  katzenkrieger = "tatzen",
  wipfellaeufer = "baum",
  dunkelelfen = "spinne",
  tanjian = "waage",
  karate = "karate",
  klerus = "heilig",
  werwoelfe = "wolf",
}

function setDiscordGuild()
  -- Anzeige von passenden kleinen Bildchen je nach Gilde
  local meinSymbol = symbole[gmcp.MG.char.base.guild] or "glitzer"
  setDiscordSmallIcon(meinSymbol)
end