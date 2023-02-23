-- Lebenspunkte sind umstritten, erstmal deaktivieren!
local LPVeroeffentlichen = false

function setDiscordLP()
  if LPVeroeffentlichen then
    setDiscordParty(ME.lp, ME.lp_max)
  end
end