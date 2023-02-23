-- Raum ist umstritten, erstmal deaktivieren!
local RaumVeroeffentlichen = false

function setDiscordRaum()
  if RaumVeroeffentlichen then
    setDiscordDetail(ME.raum_kurz)
    setDiscordState(ME.raum_region)
  end
end