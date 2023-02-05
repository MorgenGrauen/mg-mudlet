function zeigeEbenen()
  if not table.is_field(gmcp, "comm.channel") then return end
  faerbeText("ebenen", gmcp.comm.channel.msg)
end
