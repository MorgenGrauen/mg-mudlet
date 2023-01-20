-- Link zum Discord des MorgenGrauen im Mudlet Menu anzeigen
local LinkAnzeigen = true

function setDiscordLink()
  if LinkAnzeigen then
    setDiscordGameUrl("https://discord.gg/nHJnYHk", "MorgenGrauen")
  end
end
