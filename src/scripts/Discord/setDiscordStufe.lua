function setDiscordStufe()
  if not table.is_field(gmcp, "MG.char.info") then return end
  
  -- Stufe aufgestiegen? Grats! Dann aktualisieren:
  setDiscordSmallIconText("Stufe " .. gmcp.MG.char.info.level)
end