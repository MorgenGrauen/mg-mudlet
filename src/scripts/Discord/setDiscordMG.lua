local zeigeMorgenGrauenInDiscord = true

function setDiscordMG()
  if not zeigeMorgenGrauenInDiscord then return end
  setDiscordApplicationID("447501514915971072") -- setze MorgenGrauen (oder "" für Mudlet)
  -- usingMudletsDiscordID() -- prüft, ob MorgenGrauen oder Mudlet angezeigt wird
  setDiscordDetail("www.MorgenGrauen.info")
  setDiscordState("via Mudlet")
  setDiscordLargeIcon("drache")
  setDiscordLargeIconText("telnet mg.morgengrauen.info:4711")
  setDiscordLink()
  -- TODO: Eigentlich muss nur folgendes regelmäßig aktualisiert werden und nur bei wenigen Events!
  if table.is_field(gmcp, "MG.char.info.level") then
    setDiscordStufe()
  end
  if table.is_field(gmcp, "MG.char.base.guild") then
    setDiscordGuild()
  end
end
