local zeigeMorgenGrauenInDiscord = true

function setDiscordMG()
  if not zeigeMorgenGrauenInDiscord then return end
  setDiscordApplicationID("447501514915971072") -- setze MorgenGrauen (oder "" für Mudlet)
  -- usingMudletsDiscordID() -- prüft, ob MorgenGrauen oder Mudlet angezeigt wird
  setDiscordDetail("www.MorgenGrauen.info")
  setDiscordState("via Mudlet")
  setDiscordLargeIcon("drache")
  setDiscordLargeIconText("telnet mg.mud.de:4711")
  if gmcp and gmcp.MG and gmcp.MG.char then
    if gmcp.MG.char.info and gmcp.MG.char.info.level then
      setDiscordStufe()
    end
    if gmcp.MG.char.base and gmcp.MG.char.base.guild then
      setDiscordGuild()
    end
  end
end